<?php

namespace App\Http\Controllers\Api\Data;

use App\Http\Controllers\Controller;
use App\Models\ProductImage;
use App\Transformers\Data\ProductTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Spatie\Fractalistic\ArraySerializer;

class ProductController extends Controller
{
    public function index(Request $request): JsonResponse
    {
//        if ($request->has('limit')) {
//            $paginator->appends($request->get('limit'));
//        }
        if ($request->has('category')) {
            $paginator = Product::query()
                ->where('category', '=', $request->get('category'))
                ->where('is_sold','=',false)
                ->orderBy('created_at', 'desc')
                ->get();
        } else if ($request->has('search')) {
            $paginator = Product::query()
                ->where('title', 'like', '%'.$request->get('search').'%')
                ->where('is_sold','=',false)
                ->orWhere('description', 'like', '%'.$request->get('search').'%')
                ->orWhere('category', 'like', '%'.$request->get('search').'%')
                ->orderBy('created_at', 'desc')
                ->get();
        } else if ($request->has('limit')) {
            $paginator = Product::query()
                ->where('is_sold','=',false)
                ->orderBy('created_at', 'desc')
                ->limit($request->get('limit'))
                ->get();
        } else {
            $paginator = Product::query()
                ->where('is_sold','=',false)
                ->orderBy('created_at', 'desc')
                ->get();
        }

        return fractal($paginator, new ProductTransformer())
            ->parseIncludes(['user'])
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function show(Product $product): JsonResponse
    {
        return fractal($product, new ProductTransformer())
            ->parseIncludes(['user'])
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'title' => 'required|max:70',
            'price' => 'required',
            'description' => 'required|min:20|max:700',
            'category' => 'required',
        ]);

        $user = Auth::user();
        $product = Product::create([
            'title' => $request['title'],
            'price' => $request['price'],
            'description' => $request['description'],
            'is_sold' => false,
            'category' => $request['category'],
            'user_id' => $user->uuid,
        ]);

        return fractal($product, new ProductTransformer())
            ->parseIncludes(['user'])
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function update(Request $request, Product $product): JsonResponse
    {
        $user = Auth::user();
        if ($user->uuid == $product->user_id || $user->hasPermissionTo('Update products')) {
            $request->validate([
                'title' => 'sometimes|required|max:70',
                'price' => 'sometimes|required',
                'description' => 'sometimes|required|min:20|max:700',
                'is_sold' => 'sometimes|required',
                'category' => 'sometimes|required',
            ]);

            $product->update($request->except(['user_id']));
            return fractal($product, new ProductTransformer())
                ->parseIncludes(['user'])
                ->serializeWith(new ArraySerializer())
                ->respond();
        }

        return response()->json(["success" => false], 401);
    }

    public function destroy(Product $product): JsonResponse
    {
        $user = Auth::user();
        if ($user->uuid == $product->user_id || $user->hasPermissionTo('Delete products')) {
            $productImages = ProductImage::where('product_id', $product->id);
            $productImages->delete();
            $product->delete();
            return response()->json(["success" => true]);
        }

        return response()->json(["success" => false], 401);
    }

    public function myProduct(): JsonResponse
    {
        $user = Auth::user();
        $products = Product::query()
            ->where('user_id', '=', $user->uuid)
            ->orderBy('created_at', 'desc')
            ->get();

        return fractal($products, new ProductTransformer())
            ->parseIncludes(['user'])
            ->serializeWith(new ArraySerializer())
            ->respond();
    }
}
