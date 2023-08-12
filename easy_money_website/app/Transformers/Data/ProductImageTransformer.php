<?php

namespace App\Transformers\Data;

use App\Models\ProductImage;
use League\Fractal\TransformerAbstract;

class ProductImageTransformer extends TransformerAbstract
{
    public function transform(ProductImage $model): array
    {
        return [
            'path' => $model->path,
        ];
    }
}
