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

function postRequest(get_url, ok_cb, err_cb, params)
{
    var xmlhttp = new XMLHttpRequest();
    var url = get_url;

    xmlhttp.open("POST", url, true);

    xmlhttp.setRequestHeader("Accept", "application/json");
    xmlhttp.setRequestHeader("Content-type", "application/json");
    xmlhttp.setRequestHeader("Content-length", params.length);
    xmlhttp.setRequestHeader("Connection", "close");


    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
            onRequestReady(xmlhttp.responseText, ok_cb);
        }
        // TODO: implement error callback
    }

    xmlhttp.send(params);
}



function onRequestReady(response, ok_cb) {
    ok_cb(JSON.parse(response));
}

function onRequestError(err_cb) {
    err_cb();
}
