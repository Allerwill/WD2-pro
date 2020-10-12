<!-- Footer ================================================================== -->
<div  id="footerSection">
    <div class="container">
        <div class="row">
            <div class="span9">
                <?php echo @$sys_footer->value; ?>
            </div>
            <div id="socialMedia" class="span3 pull-right">
                <h5>Liên kết </h5>
                <?php if (@$sys_facebook->stt == "ON"): ?>
                    <a href="{{@$sys_facebook->value}}" target="_blank"><img width="60" height="60" src="{{asset('images/sys/facebook.png')}}" title="facebook" alt="facebook"/></a>
                <?php endif; ?>
                <?php if (@$sys_instagram->stt == "ON"): ?>
                    <a href="{{@$sys_instagram->value}}" target="_blank"><img width="60" height="60" src="{{asset('images/sys/instagram.png')}}" title="instagram" alt="instagram"/></a>
                    <a href="https://www.linkedin.com/in/allerwill/" target="_blank"><img width="60" height="60" src="{{asset('images/sys/LinkedIn.jpg')}}" title="Linkedin" alt="linkedin"/></a>
                <?php endif; ?>
                <?php if (@$sys_linkedin->stt == "ON"): ?>
                    <a href="{{@$sys_linkedin->value}}"><img width="60" height="60" src="{{asset('images/sys/LinkedIn.jpg')}}" title="linkedin" alt="linkedin"/></a>
                <?php endif; ?>
            </div> 
        </div>
    </div>
    <div class="container" style="font-family: 'Century Gothic'">
        <script>
            function welcome() {
                var elm = document.getElementById('footerWelcome');
                var da = new Date();
                var message = '&#169; ' + da.getFullYear() + ' by LEQ with ❤';
                elm.innerHTML = message;
            }
            window.setInterval(function() {
                try {
                    welcome();
                } catch(e) {}
            }, 500);
        </script>
        <h4 style="text-align: center;" id='footerWelcome'></h4>
    </div>
</div>
<script src="{{asset('js/jquery.js')}}" type="text/javascript"></script>
<script src="{{asset('js/bootstrap.min.js')}}" type="text/javascript"></script>
<script src="{{asset('js/google-code-prettify/prettify.js')}}"></script>
<script src="{{asset('js/bootshop.js')}}"></script>
<script src="{{asset('js/jquery.lightbox-0.5.js')}}"></script>
