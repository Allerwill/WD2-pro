@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <!-- Sidebar end=============================================== -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Home</a> <span class="divider">/</span></li>
                    <li class="active">Register</li>
                </ul>
                <div class="row">
                    <div class="span9">
                        <div class="well">
                            <h5>Register an account</h5><br/>
                            <form action="{{route('register')}}" method="post">
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
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Full name:</label>
                                        <input class="span6" name="fullname" type="text" placeholder="Full name"
                                               required="true" max="55">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Email:</label>
                                        <input class="span6" name="email" type="email" placeholder="Email"
                                               required="true">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Phone number:</label>
                                        <input class="span6" name="phone" type="tel" placeholder="Phone number" required="true">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Address:</label>
                                        <input class="span6" name="address" type="text" placeholder="Address" required="true">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Password:</label>
                                        <input class="span6" name="password" type="password" placeholder="Password" required="true">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="span2" style="text-align: left;">Confirm password:</label>
                                        <input class="span6" name="repassword" type="password" placeholder="Confirm password" required="true">
                                    </div>
                                </div>
                                <div class="controls">
                                    <label class="span2"></label>
                                    <button type="submit" class="span3 btn block">Register an account</button>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <br><br>
                                        <a href="{{route('login')}}" style="text-decoration:underline">Already have an account!</a><br>
                                        <a href="{{route('repass')}}" style="text-decoration:underline">Forgot password?</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>	
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
@endsection
