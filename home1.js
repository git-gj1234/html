let current = 0;
function blank(){}
//document.addEventListener("click",TopRibbon());
function slideshow(n){
    let i;
    let slides = document.getElementsByClassName("slides");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    l = slides.length;
    if(current+n>l-1){
        slides[0].style.display = "block";
        current = 0;
    }
    else if(current+n<0){
        slides[l-1].style.display = "block";
        current = l-1;
    }
    else{
        slides[current+n].style.display = 'block';
        current += n;
    }
}
var lastValue = 0;
document.onscroll = function TopRibbon(){
    let b = document.getElementById('TopRibbon');
    let cur = document.documentElement.scrollTop;
    if(lastValue-20 > cur){
        b.style.visibility = 'visible'; //scroll up
        b.classList.remove('stayUp');
        b.classList.add('visibleOn');
        
    }
    else if(lastValue+20 < cur){
        //scroll down
        b.classList.add('stayUp');
        b.classList.remove('visibleOn');
        setTimeout(blank,1500);
        b.style.visibility = 'hidden';
    }
    lastValue = cur;
};

document.onscroll = function category(){
    b = document.getElementById("category");
    if(document.documentElement.scrollTop>398){    
        b.classList.add("stick");
    }
    else {
        b.classList.remove("stick");
    }
    console.log(document.documentElement.scrollTop);
}



//document.addEventListener("srcoll",TopRibbon());