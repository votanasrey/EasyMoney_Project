<?php

namespace App\Http\Controllers\Api\Data;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Transformers\Data\CategoryTransformer;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Spatie\Fractalistic\ArraySerializer;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:Create categories')->only('store');
        $this->middleware('permission:Update categories')->only('update');
        $this->middleware('permission:Delete categories')->only('destroy');
    }

    public function index(): JsonResponse
    {
        $categories = Category::all();

        return fractal($categories, new CategoryTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function show(Category $category): JsonResponse
    {
        return fractal($category, new CategoryTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'name' => 'required|unique:categories,name',
        ]);
        $category = Category::create($request->all());
        return fractal($category, new CategoryTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function update(Request $request, Category $category): JsonResponse
    {
        $request->validate([
            'name' => 'required|unique:categories,name',
        ]);
        $category->update($request->all());
        return fractal($category, new CategoryTransformer())
            ->serializeWith(new ArraySerializer())
            ->respond();
    }

    public function destroy(Category $category): JsonResponse
    {
        $category->delete();
        return response()->json(null, 204);
    }
}
