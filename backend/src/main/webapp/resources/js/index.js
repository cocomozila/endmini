window.onload = function(){

    var x_position = 0;

    document.getElementById("left_btn").addEventListener("click", ()=>{
        if (x_position >= 100) {
            x_position -= 100;
            document.getElementById("main_img_scroll").style.transform = 'translate(-'+ x_position +'vw)';
        }
    });
    document.getElementById("right_btn").addEventListener("click", ()=>{
        if (x_position <= 200) {
            x_position += 100;
            document.getElementById("main_img_scroll").style.transform = 'translate(-'+ x_position +'vw)';
        }
    });
    var a = setInterval(()=>{
        if ( x_position == 300 ) {
            x_position = 0;
            document.getElementById("main_img_scroll").style.transition = '0s';
            document.getElementById("main_img_scroll").style.transform = 'translate(-'+ x_position +'vw)'
        }
        else {
            document.getElementById("main_img_scroll").style.transition = '1s';
            x_position += 100;
            document.getElementById("main_img_scroll").style.transform = 'translate(-'+ x_position +'vw)';
        }
    }, 4000);

    document.getElementById("hamburger").addEventListener("click", ()=>{
        if (document.getElementById("hamburger_1").style.opacity == '1'){
            document.getElementById("hamburger_1").style.opacity = '0'
        } else {
            document.getElementById("hamburger_1").style.opacity = '1'
        }
    });

    document.getElementById("logo").addEventListener("click", ()=>{
        location.href = "index.html";
    });

};














