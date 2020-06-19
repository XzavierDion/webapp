var devTools = {
        LOGIN_USER_KEY: 'loginUserKey',
        LOGIN_USER_TOKEN: 'loginUserToken',
        localStorateOperate(k, v) {
            if (v === undefined) {
                return localStorage.getItem(k);
            }

            return localStorage.setItem(k, v);
        },
        setLoginToken(key, token) {
            this.localStorateOperate(this.LOGIN_USER_KEY, key);
            this.localStorateOperate(this.LOGIN_USER_TOKEN, token);
        },
        requestApi: function(opts) {

            if (opts.type === undefined) {
                opts.type = 'get';
            }

            if (opts.async === undefined) {
                opts.async = true;
            }

            var urlPrefix = 'http://www.evcc.io/admin';
            // var urlPrefix = 'http://localhost:8080';
            opts.url = urlPrefix + opts.url;

            var ajaxOpt = {
                'headers': {
                    'Login-User-Key': this.localStorateOperate(this.LOGIN_USER_KEY),
                    'Login-User-Token': this.localStorateOperate(this.LOGIN_USER_TOKEN)
                },
                'url': opts.url,
                'type': opts.type,
                'async': opts.async,
                'data': opts.data,
                'crossDomain': true,
                'success': function(d) {
                    if (d.code === undefined || d.code === '200') {
                        if (opts.success) {
                            opts.success(d)
                        }
                    } else if (d.code === '501') {
                        // 跳转登录页                      
                        /*alert('请登录');*/
                        /*window.open('login.html');*/
                        window.location.href = "login.html";
                       
                    } else {
                        if (opts.failed) {
                            opts.failed();
                        } else if (d.msg !== undefined) {
                            alert(d.msg)
                        }
                    }
                },
                'error': function(e) {
                    console.log('reqeust error: ' + JSON.stringify(e))
                    if (opts.error) {
                        opts.error(e);
                    }
                }
            }

            $.ajax(ajaxOpt);
        }
    };

    /*function checkLogin() {
        devTools.requestApi({
            'url': '/api/user/isLogin',
            'success': function(d) {
                alert('success:' + JSON.stringify(d));
            },
            'failed': function(d) {
                alert('failed:' + JSON.stringify(d));
            }
        });
    }*/


