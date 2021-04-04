<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use DB;

class ProductController extends Controller
{
    public function index (Request $request) {
        $keyword = $request->keywords;
        $name = $request->name;
        try{
            $query = Product::with('category');
            
            if ($request->filled('sortBy')) {
                if ($request->sortBy == 1) {
                    $query->orderBy('created_at', 'desc');
                }
                if ($request->sortBy == 2) {
                    $query->orderBy('created_at', 'asc');
                }
                if ($request->sortBy == 3) {
                    $query->orderBy('price', 'desc');
                }
                if ($request->sortBy == 3) {
                    $query->orderBy('price', 'asc');
                }
            } else {
                $query->orderBy('created_at', 'desc');
            }

           
            if ($request->name) {
                $query->where('name', 'like', '%' . $request->name . '%')
                    ->orWhere('name_bn', 'like', '%' . $request->name . '%');
            }
            if ($request->keywords) {
                $query->where('name', 'like', '%' . $request->keywords . '%')
                    ->orWhere('name_bn', 'like', '%' . $request->keywords . '%')
                    ->orWhere('description', 'like', '%' . $request->keywords . '%')
                    ->orWhere('description_bn', 'like', '%' . $request->keywords . '%');
            }
            if ($request->product_category_id ) {
                $query->where('product_category_id', $request->product_category_id );
            }
            
            $products = $query->where('status', 1)->paginate(9);


        $products->getCollection()->transform(function($row, $key) use ($keyword)
        {
            if ($keyword) {
                $row->name = preg_replace('/(' . $keyword . ')/i', "<b class='h'>$1</b>", $row->name);
                $row->name_bn = preg_replace('/(' . $keyword . ')/i', "<b class='h'>$1</b>", $row->name_bn);
                $row->description = preg_replace('/(' . $keyword . ')/i', "<b class='h'>$1</b>", $row->description);
                $row->description_bn = preg_replace('/(' . $keyword . ')/i', "<b class='h'>$1</b>", $row->description_bn);
            }
            return $row;
        });
            



        }catch (\Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'data'        => $products,
        ]);
    }

    public function view($id) {
        try{
            $product = Product::with('category', 'unit', 'user')->where('id',$id)->first();


        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'data'    => $product,
        ]);
    }

}
