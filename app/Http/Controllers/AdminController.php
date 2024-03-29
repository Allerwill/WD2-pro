<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Auth;
use File;
use Illuminate\Http\Request;
use Hash;
use Session;
use App\ProductType;
use App\Product;
use App\Silde;
use App\User;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\System;

class AdminController extends Controller {

    public function getDashboard() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return view('admin.dashboard');
        } else {
            return view('admin.loginadmin');
        }
    }

    //Get All
    public function getType() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(ProductType::get());
            $key = "";
            if (Session::get('searchtype')) {
                $key = Session::get('searchtype');
            }
            $per = 3;
            if (Session::get('perpagetype')) {
                $per = Session::get('perpagetype');
            }
            $xs = ProductType::where('name', 'LIKE', "%" . $key . "%")
                    ->orWhere('stt', 'LIKE', "" . $key . "")
                    ->orderBy('id', 'DESC')
                    ->paginate($per);
            return view('admin.types', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postType(Request $req) {
        Session::put('searchtype', $req->searchtype);
        Session::put('perpagetype', $req->perpagetype);
        return redirect()->route('types');
    }

    public function getProducts() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(Product::get());
            $key = "";
            if (Session::get('searchproduct')) {
                $key = Session::get('searchproduct');
            }
            $per = 3;
            if (Session::get('perpageproduct')) {
                $per = Session::get('perpageproduct');
            }
            $xs = Product::where('name', 'LIKE', "%" . $key . "%")
                    ->orWhere('stt', 'LIKE', "" . $key . "")
                    ->orderBy('id', 'DESC')
                    ->paginate($per);
            return view('admin.products', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postProducts(Request $req) {
        Session::put('searchproduct', $req->searchproduct);
        Session::put('perpageproduct', $req->perpageproduct);
        return redirect()->route('products');
    }

    public function getSlides() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(Silde::get());
            $per = 3;
            if (Session::get('perpageslide')) {
                $per = Session::get('perpageslide');
            }
            $xs = Silde::where('id', '<>', null)
                    ->orderBy('id', 'DESC')
                    ->paginate($per);
            return view('admin.slides', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postSlides(Request $req) {
        Session::put('perpageslide', $req->perpageslide);
        return redirect()->route('slides');
    }

    public function getUsers() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(User::get());
            $key = "";
            if (Session::get('searchuser')) {
                $key = Session::get('searchuser');
            }
            $per = 3;
            if (Session::get('perpageuser')) {
                $per = Session::get('perpageuser');
            }
            $xs = User::where('full_name', 'LIKE', "%" . $key . "%")
                    ->orWhere('email', 'LIKE', "%" . $key . "%")
                    ->orWhere('stt', 'LIKE', "" . $key . "")
                    ->orderBy('id', 'DESC')
                    ->paginate($per);
            return view('admin.users', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postUsers(Request $req) {
        Session::put('searchuser', $req->searchuser);
        Session::put('perpageuser', $req->perpageuser);
        return redirect()->route('users');
    }

    public function getCustomers() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(Customer::get());
            $key = "";
            if (Session::get('searchcustomer')) {
                $key = Session::get('searchcustomer');
            }
            $per = 3;
            if (Session::get('perpagecustomer')) {
                $per = Session::get('perpagecustomer');
            }
            $xs = Customer::where('name', 'LIKE', "%" . $key . "%")
                    ->orWhere('email', 'LIKE', "%" . $key . "%")
                    ->orWhere('address', 'LIKE', "%" . $key . "%")
                    ->orWhere('phone', 'LIKE', "%" . $key . "%")
                    ->orWhere('stt', 'LIKE', "" . $key . "")
                    ->orderBy('id', 'DESC')
                    ->paginate($per);
            return view('admin.customers', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postCustomers(Request $req) {
        Session::put('searchcustomer', $req->searchcustomer);
        Session::put('perpagecustomer', $req->perpagecustomer);
        return redirect()->route('customers');
    }

    public function getBills() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $s = count(Bill::get());
            $key = "";
            if (Session::get('searchbill')) {
                $key = Session::get('searchbill');
            }
            $per = 3;
            if (Session::get('perpagebill')) {
                $per = Session::get('perpagebill');
            }
            $xs = Bill::where('total', 'LIKE', "" . $key . "%")
                            ->orWhere('payment', 'LIKE', "" . $key . "")
                            ->orWhere('code', 'LIKE', "" . $key . "")
                            ->orderBy('id', 'DESC')->paginate($per);
            return view('admin.bills', compact('xs', 's'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postBills(Request $req) {
        Session::put('searchbill', $req->searchbill);
        Session::put('perpagebill', $req->perpagebill);
        return redirect()->route('bills');
    }

    //Get Add
    public function getAddtype() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return view('admin.addtype');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getAddproduct() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $ts = ProductType::get();
            return view('admin.addproduct', compact('ts'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getAddslide() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $xs = Product::get();
            return view('admin.addslide', compact('xs'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getAdduser() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return view('admin.adduser');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getAddcustomer() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return view('admin.addcustomer');
        } else {
            return view('admin.loginadmin');
        }
    }

    //Get edit
    public function getEdittype($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = ProductType::where('id', '=', $id)->first();
            if ($x) {
                return view('admin.edittype', compact('x'));
            } else {
                return redirect('types');
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getEditproduct($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $ts = ProductType::get();
            $x = Product::where('id', '=', $id)->first();
            if ($x) {
                return view('admin.editproduct', compact('x', 'ts'));
            } else {
                return redirect('products');
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getEditslide($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $xs = Product::get();
            $x = Silde::where('id', '=', $id)->first();
            if ($x) {
                return view('admin.editslide', compact('x', 'xs'));
            } else {
                return redirect('slides');
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getEditcustomer($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Customer::where('id', '=', $id)->first();
            if ($x) {
                return view('admin.editcustomer', compact('x'));
            } else {
                return redirect('customers');
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    //Post add
    public function postAddtype(Request $req) {
        $this->validate($req, [
            'name' => 'required',
                ], [
            'name.required' => 'Please input your full name, ',
        ]);
        $x = new ProductType;
        $x->name = $req->name;
        $x->description = $req->description;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/type', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Incorrect image format!');
            }
        } else {
            $x->image = "";
        }
        $x->save();
        return redirect()->back()->with('message', 'Added successfully!');
    }

    public function postAddproduct(Request $req) {
        $this->validate($req, [
            'name' => 'required',
            'unit_price' => 'required',
            'promotion_price' => 'required'
                ], [
            'name.required' => 'Please enter your name, ',
            'unit_price.required' => 'Please enter original price, ',
            'promotion_price.required' => 'Please enter discount price, '
        ]);
        $x = new Product;
        $x->name = $req->name;
        $x->id_type = $req->id_type;
        $x->description = $req->description;
        $x->unit_price = $req->unit_price;
        $x->promotion_price = $req->promotion_price;
        $x->new = $req->new;
        $x->unit = $req->unit;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/product', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!)');
            }
        } else {
            $x->image = "";
        }
        $x->save();
        return redirect()->back()->with('message', 'Added successfully!');
    }

    public function postAddslide(Request $req) {
        $x = new Silde;
        $x->link = $req->link;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/slide', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!)');
            }
        } else {
            $x->image = "";
        }
        $x->save();
        return redirect()->back()->with('message', 'Added successfully!');
    }

    public function postAdduser(Request $req) {
        $this->validate($req, [
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|max:20',
            'fullname' => 'required',
            'repassword' => 'required|same:password'
                ], [
            'email.required' => 'Please input your email, ',
            'email.email' => 'Invalid Email, ',
            'email.unique' => 'The email is already existed, ',
            'fullname.required' => 'Please input your full name, ',
            'repassword.same' => 'Password is mismatch, ',
            'password.required' => 'Please input your password, ',
            'password.min' => 'The minimum length is 6 characters, ̣',
            'password.max' => 'The maximum length is 20 characters.̣'
        ]);
        $x = new User;
        $x->full_name = $req->fullname;
        $x->email = $req->email;
        $x->password = Hash::make($req->password);
        $x->phone = $req->phone;
        $x->address = $req->address;
        $x->type = $req->type;
        $x->stt = $req->stt;
        $x->save();
        return redirect()->back()->with('message', 'Added successfully!');
    }

    public function postAddcustomer(Request $req) {
        $this->validate($req, [
            'email' => 'required|email|unique:users,email',
            'name' => 'required',
                ], [
            'email.required' => 'Please input your email, ',
            'email.email' => 'Invalid Email, ',
            'email.unique' => 'The email is already existed, ',
            'name.required' => 'Please input your full name, ',
        ]);
        $x = new Customer;
        $x->name = $req->name;
        $x->email = $req->email;
        $x->phone = $req->phone;
        $x->address = $req->address;
        $x->stt = "ON";
        $x->save();
        return redirect()->back()->with('message', 'Added successfully!');
    }

    //Post edit
    public function postEdittype(Request $req) {
        $this->validate($req, [
            'name' => 'required',
                ], [
            'name.required' => 'Please input your full name, ',
        ]);
        $x = ProductType::where('id', '=', $req->id)->first();
        $x->name = $req->name;
        $x->description = $req->description;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            File::delete('images/type/' . $req->old_image);
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/type', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!).');
            }
        } else {
            $x->image = $req->old_image;
        }
        $x->save();
        return redirect()->back()->with('message', 'Save successfully!');
    }

    public function postEditproduct(Request $req) {
        $this->validate($req, [
            'name' => 'required',
            'unit_price' => 'required',
            'promotion_price' => 'required'
                ], [
            'name.required' => 'Please input your full name, ',
            'unit_price.required' => 'Please enter original price, ',
            'promotion_price.required' => 'Please enter discount price, '
        ]);
        $x = Product::where('id', '=', $req->id)->first();
        $x->name = $req->name;
        $x->id_type = $req->id_type;
        $x->description = $req->description;
        $x->unit_price = $req->unit_price;
        $x->promotion_price = $req->promotion_price;
        $x->new = $req->new;
        $x->unit = $req->unit;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            File::delete('images/product/' . $req->old_image);
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/product', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!).');
            }
        } else {
            $x->image = $req->old_image;
        }
        $x->save();
        return redirect()->back()->with('message', 'Save successfully!');
    }

    public function postEditslide(Request $req) {
        $x = Silde::where('id', '=', $req->id)->first();
        $x->link = $req->link;
        $x->stt = $req->stt;
        //Upload Image
        if ($req->hasFile('image')) {
            File::delete('images/slide/' . $req->old_image);
            $file = $req->file('image');
            $file_ex = $file->getClientOriginalExtension();
            if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                $file_name = str_random(16) . '.' . $file_ex;
                $file->move('images/slide', $file_name);
                $x->image = $file_name;
            } else {
                return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!).');
            }
        } else {
            $x->image = $req->old_image;
        }
        $x->save();
        return redirect()->back()->with('message', 'Save successfully!');
    }

    public function postEditcustomer(Request $req) {
        $this->validate($req, [
            'email' => 'required|email',
            'name' => 'required',
                ], [
            'email.required' => 'Please input your email, ',
            'email.email' => 'Invalid picture format! ( *.png; *.jpg are accepted!)., ',
            'name.required' => 'Please input your full name, ',
        ]);
        $x = Customer::where('id', '=', $req->id)->first();
        $x->name = $req->name;
        $x->email = $req->email;
        $x->phone = $req->phone;
        $x->address = $req->address;
        $x->stt = $req->stt;
        $x->save();
        return redirect()->back()->with('message', 'Save successfully!');
    }

    //Delete
    public function getDeltype($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = ProductType::where('id', $id)->first();
            $n = $x->name;
            File::delete('images/type/' . $x->image);
            $x->delete();
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getDelproduct($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Product::where('id', $id)->first();
            $n = $x->name;
            File::delete('images/product/' . $x->image);
            $x->delete();
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getDelslide($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Silde::where('id', $id)->first();
            $n = $x->link;
            File::delete('images/slide/' . $x->image);
            $x->delete();
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getDeluser($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = User::where('id', $id)->first();
            $n = $x->email;
            $x->delete();
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getDelcustomer($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Customer::where('id', $id)->first();
            $n = $x->name;
            $x->delete();
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getDelbill($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Bill::where('id', $id)->first();
            $n = $x->id;
            $x->delete();
            $bs = BillDetail::where('id_bill', $id)->get();
            foreach ($bs as $b) {
                $x = BillDetail::where('id', $b->id)->first();
                $x->delete();
            }
            return redirect()->back()->with('message', 'Deleted ' . $n . ' !');
        } else {
            return view('admin.loginadmin');
        }
    }

    //Set Status
    public function setSttType($id) {
        $x = ProductType::where('id', $id)->first();
        if ($x->stt == "ON") {
            $x->stt = "OFF";
        } else {
            $x->stt = "ON";
        }
        $x->save();
        return redirect()->back();
    }

    public function setSttProduct($id) {
        $x = Product::where('id', $id)->first();
        if ($x->stt == "ON") {
            $x->stt = "OFF";
        } else {
            $x->stt = "ON";
        }
        $x->save();
        return redirect()->back();
    }

    public function setSttSlide($id) {
        $x = Silde::where('id', $id)->first();
        if ($x->stt == "ON") {
            $x->stt = "OFF";
        } else {
            $x->stt = "ON";
        }
        $x->save();
        return redirect()->back();
    }

    public function setSttUser($id) {
        $x = User::where('id', $id)->first();
        if ($x->stt == "ON") {
            $x->stt = "OFF";
        } else {
            $x->stt = "ON";
        }
        $x->save();
        return redirect()->back();
    }

    public function setSttCustomer($id) {
        $x = Customer::where('id', $id)->first();
        if ($x->stt == "ON") {
            $x->stt = "OFF";
        } else {
            $x->stt = "ON";
        }
        $x->save();
        return redirect()->back();
    }

    public function setSttBill($id) {
        $x = Bill::where('id', $id)->first();
        if ($x->stt == "0" || $x->stt == "") {
            $x->stt = "1";
        } else if ($x->stt == "1") {
            $x->stt = "2";
        } else {
            $x->stt = "0";
        }
        $x->save();
        return redirect()->back();
    }

    //Get View
    public function getViewtype($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = ProductType::where('id', $id)->first();
            if (isset($x)) {
                return view('admin.viewtype', compact('x'));
            } else {
                return redirect()->back();
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getViewproduct($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Product::where('id', $id)->first();
            if (isset($x)) {
                return view('admin.viewproduct', compact('x'));
            } else {
                return redirect()->back();
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getViewuser($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = User::where('id', $id)->first();
            if (isset($x)) {
                return view('admin.viewuser', compact('x'));
            } else {
                return redirect()->back();
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getViewcustomer($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $x = Customer::where('id', $id)->first();
            if (isset($x)) {
                return view('admin.viewcustomer', compact('x'));
            } else {
                return redirect()->back();
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getViewbill($id) {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $b = Bill::where('id', $id)->first();
            $bd = BillDetail::where('id_bill', $id)->get();
            if (isset($b) && isset($bd)) {
                return view('admin.viewbill', compact('id', 'b', 'bd'));
            } else {
                return redirect()->back();
            }
        } else {
            return view('admin.loginadmin');
        }
    }

    //Setting system
    public function getSystem() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $logo = System::where('key', 'logo')->first();
            $title = System::where('key', 'title')->first();
            $slide = System::where('key', 'slide')->first();
            $type = System::where('key', 'type')->first();
            $about = System::where('key', 'about')->first();
            $contact = System::where('key', 'contact')->first();
            $header = System::where('key', 'header')->first();
            $footer = System::where('key', 'footer')->first();
            $payment = System::where('key', 'payment')->first();
            $facebook = System::where('key', 'facebook')->first();
            $instagram = System::where('key', 'instagram')->first();
            $google = System::where('key', 'google')->first();
            return view('admin.system', compact('logo', 'title', 'slide', 'type', 'about', 'contact', 'header', 'footer', 'payment', 'facebook', 'instagram', 'google'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function setSysStt($id) {
        $sys = System::where('id', $id)->first();
        if ($sys->stt == "ON") {
            $sys->stt = "OFF";
        } else {
            $sys->stt = "ON";
        }
        $sys->save();
        return redirect()->back();
    }

    public function setSyslogo(Request $req) {
        $x = System::where('key', 'logo')->first();
        if ($x) {
            if ($req->hasFile('image')) {
                File::delete('images/sys/' . $req->old_image);
                $file = $req->file('image');
                $file_ex = $file->getClientOriginalExtension();
                if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                    $file_name = 'logo.' . $file_ex;
                    $file->move('images/sys/', $file_name);
                    $x->value = $file_name;
                } else {
                    return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!).');
                }
            }
            $x->save();
            return redirect()->back()->with('message', 'Logo changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSystitle(Request $req) {
        $x = System::where('key', 'title')->first();
        if ($x) {
            $x->value = $req->value;
            $x->save();
            return redirect()->back()->with('message', 'Web title changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSysabout(Request $req) {
        $x = System::where('key', 'about')->first();
        if ($x) {
            $x->value = $req->value;
            $x->save();
            return redirect()->back()->with('message', 'About us changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSyscontact(Request $req) {
        $x = System::where('key', 'contact')->first();
        if ($x) {
            $x->value = $req->value;
            $x->save();
            return redirect()->back()->with('message', 'Contact changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSysheader(Request $req) {
        $x = System::where('key', 'header')->first();
        if ($x) {
            $x->value = $req->value;
            $x->save();
            return redirect()->back()->with('message', 'News Notif changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSysfooter(Request $req) {
        $x = System::where('key', 'footer')->first();
        if ($x) {
            $x->value = $req->value;
            $x->save();
            return redirect()->back()->with('message', 'Contact changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSyspayment(Request $req) {
        $x = System::where('key', 'payment')->first();
        if ($x) {
            if ($req->hasFile('image')) {
                File::delete('images/sys/' . $req->old_image);
                $file = $req->file('image');
                $file_ex = $file->getClientOriginalExtension();
                if ($file_ex == "jpg" || $file_ex == "png" || $file_ex == "jpeg" || $file_ex == "JPG" || $file_ex == "PNG" || $file_ex == "JPEG") {
                    $file_name = 'payment.' . $file_ex;
                    $file->move('images/sys/', $file_name);
                    $x->value = $file_name;
                } else {
                    return redirect()->back()->with('message', 'Invalid picture format! ( *.png; *.jpg are accepted!).');
                }
            }
            $x->save();
            return redirect()->back()->with('message', 'Payment method changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function setSyssocial(Request $req) {
        $facebook = System::where('key', 'facebook')->first();
        $instagram = System::where('key', 'instagram')->first();
        $google = System::where('key', 'google')->first();
        if ($facebook && $instagram && $google) {
            $facebook->value = $req->facebook;
            $facebook->save();
            $instagram->value = $req->instagram;
            $instagram->save();
            $google->value = $req->google;
            $google->save();
            return redirect()->back()->with('message', 'Social media changed successfully!');
        } else {
            return redirect()->back();
        }
    }

    public function getLogin() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return redirect()->route('dashboard');
        } else {
            return view('admin.loginadmin');
        }
    }

    //Post login 
    public function postLogin(Request $req) {
        $this->validate($req, [
            'email' => 'required|email',
            'password' => 'required|min:6|max:20'
                ], [
            'email.required' => 'Please input your email, ',
            'email.email' => 'Invalid picture format! ( *.png; *.jpg are accepted!)., ',
            'password.required' => 'Please input your password, ',
            'password.min' => 'The minimum length is 6 characters, ̣',
            'password.max' => 'The maximum length is 20 characters.̣'
        ]);
        $checklog = array('email' => $req->email, 'password' => $req->password);
        if (Auth::attempt($checklog) && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            return redirect()->back()->with(['alert' => 'success', 'message' => 'Logged in successfully!']);
        } else if (Auth::attempt($checklog) && Auth::user()->type != "Admin" && Auth::user()->type != "Supper Admin") {
            return redirect()->back()->with(['alert' => 'danger', 'message' => 'You are not invited to this Role!']);
        } else {
            return redirect()->back()->with(['alert' => 'danger', 'message' => 'Login Unsuccessfully!']);
        }
    }

    public function getLogout() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            Auth::logout();
            return redirect()->route('loginadmin');
        } else {
            return view('admin.loginadmin');
        }
    }

    public function getProfile() {
        if (Auth::check() && (Auth::user()->type == "Admin" || Auth::user()->type == "Supper Admin")) {
            $u = User::where('email', Auth::user()->email)->first();
            return view('admin.profile', compact('u'));
        } else {
            return view('admin.loginadmin');
        }
    }

    public function postProfile(Request $req) {
        $this->validate($req, [
            'password' => 'required|min:6|max:20',
            'fullname' => 'required',
            'repassword' => 'required|same:password'
                ], [
            'fullname.required' => 'Please input your full name, ',
            'repassword.same' => 'Password mismatch, ',
            'password.required' => 'Please input your password, ',
            'password.min' => 'The minimum length is 6 characters, ̣',
            'password.max' => 'The maximum length is 20 characters.̣'
        ]);
        $x = User::where('id', Auth::user()->id)->first();
        $x->full_name = $req->fullname;
        $x->password = Hash::make($req->password);
        $x->phone = $req->phone;
        $x->address = $req->address;
        $x->save();
        return redirect()->back()->with('message', 'Save successfully!');
    }

}
