.pragma library

function request(get_url, ok_cb, err_cb) {
    var xmlhttp = new XMLHttpRequest();
    var url = get_url;

    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
            onRequestReady(xmlhttp.responseText, ok_cb);
        }
        // TODO: implement error callback
    }

    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function onRequestReady(response, ok_cb) {
    var arr = JSON.parse(response);
    var json_str = JSON.stringify(response);
    ok_cb(json_str);
}

function onRequestError(err_cb) {
    err_cb();
}
