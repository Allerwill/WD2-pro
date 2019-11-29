@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9" id="mainCol">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Home</a> <span class="divider">/</span></li>
                    <li class="active">Contact</li>
                </ul>
                <h3>Contact Us</h3>
                <hr class="soft"/>
                <div class="row">
                    <div class="span3">
                        <h4>Details</h4>
                        <?php echo @$sys_contact->value; ?>
                    </div>
                    <div class="span9">
                        <h4>Respond</h4>
                        <form action="{{url('testmail/test.php')}}" method="post" class="form-horizontal">
                            <input name="url" type="hidden" value="{{route('contact')}}"/>
                            <div class="control-group">
                                <input name="name" type="text" placeholder="Name" class="input-xlarge"/>
                            </div>
                            <div class="control-group">
                                <input name="mail" type="text" placeholder="Email" class="input-xlarge"/>
                            </div>
                            <div class="control-group">
                                <input name="title" type="text" placeholder="Title" class="input-xlarge"/>
                            </div>
                            <div class="control-group">
                                <textarea name="content" id="demo" class="form-control ckeditor"></textarea>
                            </div>
                            <button class="btn" type="submit">Send respond</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>	
        <div class="row">
            <div class="span12">
                <iframe style="width:100%; height:300px; border: 0px" scrolling="no" src="https://maps.google.co.uk/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=18+California,+Fresno,+CA,+United+States&amp;aq=0&amp;oq=18+California+united+state&amp;sll=39.9589,-120.955336&amp;sspn=0.007114,0.016512&amp;ie=UTF8&amp;hq=&amp;hnear=18,+Fresno,+California+93727,+United+States&amp;t=m&amp;ll=36.732762,-119.695787&amp;spn=0.017197,0.100336&amp;z=14&amp;output=embed"></iframe><br />
                <small><a href="https://maps.google.co.uk/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=18+California,+Fresno,+CA,+United+States&amp;aq=0&amp;oq=18+California+united+state&amp;sll=39.9589,-120.955336&amp;sspn=0.007114,0.016512&amp;ie=UTF8&amp;hq=&amp;hnear=18,+Fresno,+California+93727,+United+States&amp;t=m&amp;ll=36.732762,-119.695787&amp;spn=0.017197,0.100336&amp;z=14" style="color:#0000FF;text-align:left">View on Maps</a></small>
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
@endsection