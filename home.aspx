<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="dbms.home" %>



<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <div><p style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color: #0099FF">Popular Products</p>
        <p style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color: #0099FF">&nbsp;</p>
        <p style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color: #0099FF">&nbsp;</p>
        <p style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color: #0099FF">&nbsp;</p></div>

    <script src="JavaScript/jquery-1.3.2.min.js" type="text/javascript" lang="javascript"></script>
    <link href="styles/style2.css" rel="stylesheet" />
    


    <div class="row">

     <div class="col-lg-3 col-md-3">
          
                <div class="slideshow-container">
    
                                <div class="mySlides fade">
                                <img src="images/img1_1.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides fade">
                                <img src="images/img1_2.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides fade">
                                <img src="images/img1_3.jpg" style="width:100%"/>

                                </div>
                                <a class="prev" onclick="plusSlides(-1)">❮</a>
                                <a class="next" onclick="plusSlides(1)">❯</a>
                                </div>
                                <br/>

                                <div style="text-align:center"> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                </div>
     </div>

        <div class="col-lg-9 col-md-9">

            <h5 style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color:crimson">Head Graphene Touch Speed Pro</h5>
                <p style="font-family:'Century Schoolbook'; font-style:italic">Head updates one of their great performance racquets with a softer feel and even more control.
                    A great option for intermediate and advanced players looking for maneuverability and control.
                    Headsize: 100in². String Pattern: 18x20. Standard Length.</p>
        </div>
    </div>



    <div class="row">

     <div class="col-lg-3 col-md-3">
          
                <div class="slideshow-container">
    
                                <div class="mySlides1 fade">
                                <img src="images/img2_1.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides1 fade">
                                <img src="images/img2_2.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides1 fade">
                                <img src="images/img2_3.jpg" style="width:100%"/>

                                </div>
                                <a class="prev" onclick="plusSlides1(-1)">❮</a>
                                <a class="next" onclick="plusSlides1(1)">❯</a>
                                </div>
                                <br/>

                                <div style="text-align:center"> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                </div>
     </div>

        <div class="col-lg-9 col-md-9">

           <h5 style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color:crimson">Head Graphene Touch Speed MP</h5>
    <p style="font-family:'Century Schoolbook'; font-style:italic">Boasting a slightly softer feel than its predecessor, this version of the Speed MP offers an impressive combination of spin and controllable power.
         Ideal for those who want a light player's racquet with easy acceleration and very dampened feel.
         Headsize; 100in². String Pattern: 16x19. Standard Length. </p>
        </div>
    </div>

         
    
    <div class="row">

     <div class="col-lg-3 col-md-3">
          
                <div class="slideshow-container">
    
                                <div class="mySlides2 fade">
                                <img src="images/img3_1.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides2 fade">
                                <img src="images/img3_2.jpg" style="width:100%"/>
                                </div>

                                <div class="mySlides2 fade">
                                <img src="images/img3_3.jpg" style="width:100%"/>

                                </div>
                                <a class="prev" onclick="plusSlides2(-1)">❮</a>
                                <a class="next" onclick="plusSlides2(1)">❯</a>
                                </div>
                                <br/>

                                <div style="text-align:center"> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                                <span class="dot"></span> 
                </div>
     </div>

        <div class="col-lg-9 col-md-9">
            <h5 style="font-family: 'Century Schoolbook'; font-weight: bold; font-style: normal; color: crimson">Head Graphene XT Speed MP A</h5>
    <p style="font-family:'Century Schoolbook'; font-style:italic">With its fast feel and controllable power, this is a great option for intermediate and advanced players who want a light player's racquet with massive spin potential.
         It features a groundbreaking option enabling the player to switch between a 16x16 and 16x19 string pattern.
         Headsize: 100 in². Standard Length. String Pattern. 16x16 or 16x19 </p>
           
        </div>
    </div> 
                
   
    


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

<script>
var slideIndex1 = 1;
showSlides1(slideIndex1);

function plusSlides1(n) {
  showSlides1(slideIndex1 += n);
}

function currentSlide1(n) {
  showSlides1(slideIndex1 = n);
}

function showSlides1(n) {
  var l;
  var slides1 = document.getElementsByClassName("mySlides1");
  var dots1 = document.getElementsByClassName("dot");
  if (n > slides1.length) {slideIndex1 = 1}    
  if (n < 1) {slideIndex1 = slides1.length}
  for (l = 0; l < slides1.length; l++) {
      slides1[l].style.display = "none";  
  }
  for (l = 0; l < dots1.length; l++) {
      dots1[l].className = dots1[l].className.replace(" active", "");
  }
  slides1[slideIndex1-1].style.display = "block";  
  dots1[slideIndex1-1].className += " active";
}
</script>

    <script>
var slideIndex2 = 1;
showSlides2(slideIndex2);

function plusSlides2(n) {
  showSlides2(slideIndex2 += n);
}

function currentSlide2(n) {
  showSlides2(slideIndex2 = n);
}

function showSlides2(n) {
  var v;
  var slides2 = document.getElementsByClassName("mySlides2");
  var dots2 = document.getElementsByClassName("dot");
  if (n > slides2.length) {slideIndex2 = 1}    
  if (n < 1) {slideIndex2 = slides2.length}
  for (v = 0; v < slides2.length; v++) {
      slides2[v].style.display = "none";  
  }
  for (v = 0; v < dots2.length; v++) {
      dots2[v].className = dots2[v].className.replace(" active", "");
  }
  slides2[slideIndex2-1].style.display = "block";  
  dots2[slideIndex2-1].className += " active";
}
</script>




</asp:Content>
