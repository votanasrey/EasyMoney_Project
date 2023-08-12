<?php

namespace App\Transformers\Assets;

use App\Models\Asset;
use League\Fractal\TransformerAbstract;

/**
 * Class AssetTransformer.
 */
class AssetTransformer extends TransformerAbstract
{
    /**
     * @param Asset $model
     * @return array
     */
    public function transform(Asset $model): array
    {
        return [
            'id' => $model->uuid,
            'type' => $model->type,
            'path' => $model->path,
            'mime' => $model->mime,
            'links' => [
                'full' => url('api/assets/'.$model->uuid.'/render'),
                'thumb' => url('api/assets/'.$model->uuid.'/render?width=200&height=200'),
            ],
            'created_at' => $model->created_at->toIso8601String(),
        ];
    }
}
