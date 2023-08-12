<?php

namespace App\Http\Controllers\Api\Data;

use App\Exceptions\BodyTooLargeException;
use App\Exceptions\StoreResourceFailedException;
use App\Http\Controllers\Api\Assets\RenderFileController;
use App\Http\Controllers\Api\Assets\UploadFileController;
use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Transformers\Data\ProductImageTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\ProductImage;
use Spatie\Fractalistic\ArraySerializer;

class ProductImageController extends Controller
{

//    public function show(Request $request, $uuid)
//    {
//        $image = new RenderFileController();
//        return $image->show($request, $uuid, 'products');
//    }

    public function store(Request $request, Product $product): JsonResponse
    {
        $request->validate([
            'paths' => 'required|array',
        ]);

        $productImage = array();
        for ($i = 0; $i < count($request->get('paths')); $i++) {
            $image = ProductImage::query()->create([
                'path' => $request->get('paths')[$i],
                'product_id' => $product->id,
            ]);
            $productImage[$i] = $image;
        }

        return fractal($productImage, new ProductImageTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
