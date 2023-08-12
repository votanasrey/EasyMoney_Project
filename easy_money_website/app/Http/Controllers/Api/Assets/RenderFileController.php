<?php

namespace App\Http\Controllers\Api\Assets;

use App\Http\Controllers\Controller;
use App\Models\Asset;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class RenderFileController extends Controller
{
    public function show(Request $request, $uuid, String $folder='')
    {
        try {
            $model = Asset::byUuid($uuid)->firstOrFail();

            return $this->renderFile($model, $folder, $request->get('width'), $request->get('height'));
        } catch (ModelNotFoundException $e) {
            return $this->renderPlaceholder($request->get('width'), $request->get('height'));
        }
    }

    public function renderFile($model, String $folder, $width, $height)
    {
        $image = $this->makeFromPath($width, $height, $model->path, $folder);

        return $image->response();
    }

    public function renderPlaceholder($width, $height)
    {
        $image = Image::cache(function ($image) use ($width, $height) {
            $img = $image->canvas(800, 800, '#FFFFFF');
            $this->resize($img, $width, $height);

            return $img;
        }, 10, true);

        return $image->response();
    }

    protected function resize($img, $width, $height)
    {
        if (! empty($width) && ! empty($height)) {
            $img->resize($width, $height);
        } elseif (! empty($width)) {
            $img->resize($width, null, function ($constraint) {
                $constraint->aspectRatio();
            });
        } elseif (! empty($height)) {
            $img->resize(null, $height, function ($constraint) {
                $constraint->aspectRatio();
            });
        }

        return $img;
    }

    protected function makeFromPath($width, $height, $path, String $folder): \Intervention\Image\Image
    {
        $path = $folder.'/'.$path;
        return Image::cache(function ($image) use ($path, $width, $height) {
            $img = $image->make(Storage::get($path));
            $this->resize($img, $width, $height);

            return $img;
        }, 10, true);
    }
}
