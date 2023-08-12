<?php

namespace App\Http\Controllers\Web\Data;

use App\Http\Controllers\Controller;
use App\Models\Product;

class ProductsController extends Controller
{
    public function index() {
        $products = Product::query()
            ->with(['user', 'productImages'])
            ->orderBy('created_at', "desc")
            ->paginate(15);
        return view('products')->with(['products' => $products]);
    }
}
