// var is_weixin = (function() { //�ж�΢��UA
// 	var ua = navigator.userAgent.toLowerCase();
// 	if (ua.match(/MicroMessenger/i) == "micromessenger") {
// 		return true;
// 	} else {
// 		return false;
// 	}
// })();
var is_weixin = (function(){return navigator.userAgent.toLowerCase().indexOf('MicroMessenger') !== -1})();
window.onload = function() {
    var winHeight = typeof window.innerHeight != 'undefined' ? window.innerHeight : document.documentElement.clientHeight; //����IOS������Ҫ�Ŀ���ȥ��
    var btn = document.getElementById('J_weixin');
    var tip = document.getElementById('weixin-tip');
    var close = document.getElementById('close');
    if (is_weixin) {
        btn.onclick = function(e) {
            tip.style.height = winHeight + 'px'; //����IOS��������
            tip.style.display = 'block';
            return false;
        }
        close.onclick = function() {
            tip.style.display = 'none';
        }
    }
};