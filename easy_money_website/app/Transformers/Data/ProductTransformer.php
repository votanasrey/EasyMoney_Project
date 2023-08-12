<?php

namespace App\Transformers\Data;

use App\Models\Product;
use App\Transformers\Users\UserTransformer;
use League\Fractal\Resource\Collection;
use League\Fractal\Resource\Item;
use League\Fractal\TransformerAbstract;

class ProductTransformer extends TransformerAbstract
{
    /**
     * List of resources to automatically include
     *
     * @var array
     */
    protected $defaultIncludes = [
        'product_images',
//        'user',
//        'category',
    ];

    /**
     * List of resources possible to include
     *
     * @var array
     */
    protected $availableIncludes = [
        'user',
//        'category',
    ];

    /**
     * A Fractal transformer.
     *
     * @param Product $model
     * @return array
     */
    public function transform(Product $model): array
    {
        return [
            'id' => $model->id,
            'title' => $model->title,
            'price' => $model->price,
            'category' => $model->category,
            'description' => $model->description,
            'is_sold' => $model->is_sold,
            'created_at' => $model->created_at->toIso8601String(),
            'updated_at' => $model->updated_at->toIso8601String(),
        ];
    }

    public function includeProductImages(Product $model): Collection
    {
        return $this->collection($model->productImages, new ProductImageTransformer());
    }

//    public function includeCategory(Product $model): Item
//    {
//        return $this->item($model->category, new CategoryTransformer());
//    }

    public function includeUser(Product $model): Item
    {
        return $this->item($model->user, new UserTransformer());
    }
}
