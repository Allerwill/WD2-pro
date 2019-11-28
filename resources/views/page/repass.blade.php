@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Home</a> <span class="divider">/</span></li>
                    <li class="active">Change password</li>
                </ul>
                <table class="table table-bordered">
                    <tr><th>Change password</th></tr>
                    <tr> 
                        <td>
                            <form class="form-horizontal" action="{{route('repass')}}" method="post">
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
                                    <label class="control-label">New password:</label>
                                    <div class="controls">
                                        <input name="password" type="password" id="inputCountry" placeholder="New password" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Confirm password:</label>
                                    <div class="controls">
                                        <input name="repassword" type="password" id="inputCountry" placeholder="Confirm password" value="">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Change</button>
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