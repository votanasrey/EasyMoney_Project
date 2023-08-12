<?php

namespace App\Http\Controllers\Api\Assets;

use App\Events\AssetWasCreated;
use App\Exceptions\BodyTooLargeException;
use App\Exceptions\StoreResourceFailedException;
use App\Http\Controllers\Controller;
use App\Models\Asset;
use App\Transformers\Assets\AssetTransformer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class UploadFileController extends Controller
{
    /**
     * @var array|string[][]
     */
    protected array $validMimes = [
        'image/jpeg' => [
            'type' => 'image',
            'extension' => 'jpeg',
        ],
        'image/jpg' => [
            'type' => 'image',
            'extension' => 'jpg',
        ],
        'image/png' => [
            'type' => 'image',
            'extension' => 'png',
        ],
    ];

    /**
     * @param Request $request
     * @param String $folder
     * @return mixed
     * @throws BodyTooLargeException
     * @throws StoreResourceFailedException
     */
    public function store(Request $request, string $folder = '')
    {
        $body = base64_decode($request->getContent());
        $asset = $this->uploadFromDirectFile([
            'mime' => $request->header('Content-Type'),
            'content' => $body,
            'Content-Length' => $request->header('Content-Length'),
            'user' => $request->user(),
        ], $folder);

        event(new AssetWasCreated($asset));

        if ($folder != '') {
            return $asset;
        }

        return fractal($asset, new AssetTransformer())->respond();
    }

    /**
     * @throws StoreResourceFailedException
     * @throws BodyTooLargeException
     */
    protected function uploadFromDirectFile($attributes = [], string $folder = '')
    {
        $this->validateMime($attributes['mime']);
        $this->validateBodySize($attributes['Content-Length'], $attributes['content']);
        $path = $this->storeInFileSystem($attributes, $folder);

        return $this->storeInDatabase($attributes, $path);
    }


    protected function storeInDatabase(array $attributes, $path)
    {
        return Asset::create([
            'type' => $this->validMimes[$attributes['mime']]['type'],
            'path' => $path,
            'mime' => $attributes['mime'],
            'user_id' => !empty($attributes['user']) ? $attributes['user']->id : null,
        ]);
    }

    protected function storeInFileSystem(array $attributes, String $folder = ''): string
    {
        $path = md5(Str::random() . date('U')) . '.' . $this->validMimes[$attributes['mime']]['extension'];
        Storage::put($folder.'/'.$path, $attributes['content']);

        return $path;
    }


    /**
     * @throws StoreResourceFailedException
     */
    protected function validateMime($mime)
    {
        if (!array_key_exists($mime, $this->validMimes)) {
            throw new StoreResourceFailedException('Validation Error', [
                'Content-Type' => 'The Content Type sent is not valid',
            ]);
        }
    }

    /**
     * @throws BodyTooLargeException
     */
    protected function validateBodySize($contentLength, $content)
    {
        if ($contentLength > config('files.maxsize', 1000000) || mb_strlen($content) > config('files.maxsize', 1000000)) {
            throw new BodyTooLargeException();
        }
    }
}
