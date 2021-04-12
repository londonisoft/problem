<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Blog;

class BlogController extends Controller
{
    public function categories() {
        try{

            $data =  Category::get();

        } catch (\Exception $error) {
            return response()->json([
                'success'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'success' => true,
            'message'  => 'Data found.',
            'data'        => $data,
        ]);

    }
    public function blog($id) {
        try{

            $data =  Blog::query();

            if ($id) {
                $data->where('category_id', $id);
            }

            $data = $data->get();

        } catch (\Exception $error) {
            return response()->json([
                'success'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'success' => true,
            'message'  => 'Data found.',
            'data'        => $data,
        ]);

    }
}
