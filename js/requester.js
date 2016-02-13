.pragma library

function request(get_url, ok_cb, err_cb, type_) {
    var xmlhttp = new XMLHttpRequest();
    var url = get_url;
    var type = type_ || "GET";

    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
            onRequestReady(xmlhttp.responseText, ok_cb);
        }
        // TODO: implement error callback
    }

    xmlhttp.open(type, url, true);
    xmlhttp.send();
}

function onRequestReady(response, ok_cb) {
    ok_cb(JSON.parse(response));
}

function onRequestError(err_cb) {
    err_cb();
}
