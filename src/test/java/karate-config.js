function fn() {
if (!env) {
env = 'staging';
}
var config = {
// variables & api paths
env: env, 
myVarName: 'hello karate', 
baseUrl: 'http://localhost:9191',


tokenID : 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJKb2huIFdpY2siLCJleHAiOjE2NjkzODkwNDMsImlhdCI6MTY2OTM4MTg0M30.psInP_MvLcL8RNYkOHXbw4qb8IIfEC4iLgDRIbzPQeknWBg3vOUBfz-mvvOThqJWkLbtu2xsDCCrD7Aw7qP0NQ'
}
//'karate.env' - Get system property
var env = karate.env; 
karate.log('karate.env system property was:', env);
if (env == 'prod') {
config.baseUrl = 'https://xyz.mgapis.com/';
} else if (env == 'staging') {
config.baseUrl = 'https://abc.net/';
}
karate.configure('connectTimeout', 5000);
karate.configure('readTimeout', 5000);
return config;
}