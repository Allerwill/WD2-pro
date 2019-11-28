@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Home</a> <span class="divider">/</span></li>
                    <li>Account <span class="divider">/</span></li>
                    <li class="active">{{Auth::user()->full_name}}</li>
                </ul>
                <table class="table table-bordered">
                    <tr><th>Account infor</th></tr>
                    <tr> 
                        <td>
                            <form class="form-horizontal" action="{{route('profile')}}" method="post">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
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
                                @if(Session::has('err'))
                                <div class="alert alert-danger">
                                    <span>{{Session::get('err')}}</span>
                                </div>
                                @endif
                                <div class="control-group">
                                    <label class="control-label">Email:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="email" type="email" id="inputCountry" placeholder="Email" value="{{Auth::user()->email}}">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Full name:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="fullname" type="text" id="inputCountry" placeholder="Customer name" value="{{Auth::user()->full_name}}">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Address:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="address" type="text" id="inputCountry" placeholder="Shipping address" value="{{Auth::user()->address}}">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Phone number:</label>
                                    <div class="controls">
                                        @if(Auth::check())
                                        <input name="phone" type="tel" id="inputCountry" placeholder="Phone number" value="{{Auth::user()->phone}}">
                                        @endif
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Save changes</button>
                                    </div>
                                </div>
                            </form>
                            <a href="{{route('repass')}}">Change password</a>
                        </td>
                    </tr>
                </table>		
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
@endsection