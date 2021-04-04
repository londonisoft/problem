<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;
use DB;
class ContactController extends Controller
{
    public function index() {
        $contacts = DB::table('contacts')
        ->select('contacts.*','properties.property_id as pro_id')
        ->leftJoin('properties','contacts.property_id','properties.id')->get();

        return view("abasvumi.propertContact.index",compact("contacts"));
    }
}
