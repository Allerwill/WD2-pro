@extends('admin_master')
@section('admin_content')
<div id="page-wrapper" style="min-height: 295px;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-group input-group">
                        <span class="input-group-addon left"></span>
                        <span class="input-group-addon"><Strong>Add new</Strong> - <i class="fa  fa-info"></i></span>
                        <span class="input-group-addon right"></span>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form" action="{{route('addcustomer')}}" method="post">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                        @include('mess')
                        <div class="form-group">
                            <label>Full name:</label>
                            <input class="form-control" name="name" type="text" placeholder="Full name" max="55">
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input class="form-control" name="email" type="email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label>Phone number:</label>
                            <input class="form-control" name="phone" type="tel" placeholder="Phone number">
                        </div>
                        <div class="form-group">
                            <label>Address:</label>
                            <input class="form-control" name="address" type="text" placeholder="Address">
                        </div>
                        <div class="form-group">
                            <label>Status:</label>
                            <select name="stt" class="form-control">
                                <option value="ON">ON</option>
                                <option value="OFF">OFF</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-default">Add new</button>
                        <a href="{{route('customers')}}" class="btn btn-default">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection