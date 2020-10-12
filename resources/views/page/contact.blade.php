@extends('master')
@section('content')
<div id="mainBody">
    <div class="container">
        <div class="row">
            @include('menu')
            <div class="span9" id="mainCol">
                <ul class="breadcrumb">
                    <li><a href="{{route('home')}}">Trang chủ</a> <span class="divider">/</span></li>
                    <li class="active">Liên hệ</li>
                </ul>
                <h3>Thông tin liên hệ</h3>
                <hr class="soft"/>
                <div class="row">
                    <div class="span3">
                        <h4>Chi tiết</h4>
                        <?php echo @$sys_contact->value; ?>
                    </div>

                </div>
            </div>
        </div>	
        <div class="row">
            <div class="span12">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.46341862489!2d106.7676456147223!3d10.852314260756106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175279fc344b325%3A0xfd4b085a2978319b!2zMzggU-G7kSA1LCBMaW5oIENoaeG7g3UsIFRo4bunIMSQ4bupYywgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1602429789855!5m2!1svi!2s" width="100%" height="300px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                <small><a href="https://goo.gl/maps/J6krYCSQ2g5rNvqf7" target="_blank" style="color:#0000FF;text-align:left">Xem trên Google Maps</a></small>
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->
@endsection