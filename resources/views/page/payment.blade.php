@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Trang chủ</a> <span class="divider">/</span></li>
                    <li class="active">Giỏ hàng</li>
                </ul>
                
                @if(count($errors)>0)
                <div class="alert alert-danger">
                    @foreach($errors->all() as $err)
                    <span>{{$err}}</span>
                    @endforeach
                </div>
                @endif
                @if(Session::has('message'))
                <div class="alert alert-success">
                    <span>{{Session::get('message')}}</span>
                </div>
                @endif
                
                @if(Session::has('cart'))
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Thông tin</th>
                            <th>Unit price</th>
                            <th>Quantity</th>
                            <th>Total amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($payments as $payment)
                        <tr>
                            <td title="{{$payment['item']['name']}}">
                                <a href="{{route('product-detail',@$payment['item']['id'])}}"><img class="img-reponsive" width="100" src="images/product/{{$payment['item']['image']}}" alt="{{$payment['item']['name']}}"></a>
                            </td>
                            <td>
                                <p><a href="{{route('product-detail',@$payment['item']['id'])}}">{{@$payment['item']['name']}}</a></p>
                            </td>
                            <td>
                                <p>${{number_format(@$payment['item']['unit_price'])}}</p>
                            </td>
                            <td>
                                <div class="input-append">
                                    <a class="btn" title="Confirmed {{@$payment['qty']}}"><i class="icon-check">{{@$payment['qty']}}</i></a>
                                    <a class="btn" href="{{route('reducecart',@$payment['item']['id'])}}" title="-1"><i class="icon-minus"></i></a>
                                    <a class="btn" href="{{route('addtocart',@$payment['item']['id'])}}" title="+1"><i class="icon-plus"></i></a>
                                    <a class="btn btn-danger" href="{{route('deletecart',@$payment['item']['id'])}}" title="del"><i class="icon-remove icon-white"></i></a>
                                </div>
                            </td>
                            <td>${{@number_format($payment['item']['unit_price']*$payment['qty'])}}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <th>Total:</th>
                            <th></th>
                            <th>

                            </th>
                            <th>{{Session('cart')->totalQty}}</th>
                            <th>${{number_format(Session('cart')->totalPrice)}}</th>
                        </tr>
                    </tbody>
                </table>
                @endif

                <table class="table table-bordered">
                    <tr><th>Invoice infor</th></tr>
                    <tr> 
                        <td>
                            <form class="form-horizontal" method="post" action="{{route('payment')}}">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <div class="control-group">
                                    <label class="control-label">Full name:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="fullname" type="text" id="inputCountry" placeholder="Customer name" value="{{Auth::user()->full_name}}">
                                        @else
                                        <input name="fullname" type="text" id="inputCountry" placeholder="Customer name" value="">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Email:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="email" type="email" id="inputCountry" placeholder="Email" value="{{Auth::user()->email}}">
                                        @else
                                        <input name="email" type="email" id="inputCountry" placeholder="Email" value="">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Address:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="address" type="text" id="inputCountry" placeholder="Shipping address" value="{{Auth::user()->address}}">
                                        @else
                                        <input name="address" type="text" id="inputCountry" placeholder="Shipping address" value="">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Phone number:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="phone" type="tel" id="inputCountry" placeholder="Phone number" value="{{Auth::user()->phone}}">
                                        @else
                                        <input name="phone" type="tel" id="inputCountry" placeholder="Phone number" value="">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Note:</label>
                                    <div class="controls">
                                        <textarea name="note" id="inputCountry" placeholder="Note"></textarea>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Coupon:</label>
                                    <div class="controls">
                                        <input name="code" type="text" class="input-medium" placeholder="Coupon">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Payment method:</label>
                                    <div class="controls">
                                        <select name="payment">
                                            <option name="payment" value="COD" selected="true">Cash on delivery</option>
                                            <option name="payment" value="ATM">By ATM</option>
                                            <option name="payment" value="ZaloPay">By Zalo Pay</option>
                                            <option name="payment" value="Momo">By Momo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Payment</button>
                                    </div>
                                </div>
                            </form>				  
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
@endsection