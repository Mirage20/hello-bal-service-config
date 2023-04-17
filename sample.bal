import ballerina/http;

configurable string message = ?;
configurable string from = ?;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : from, "to" : name, "message" : message};
        return greetingMessage;
    }
}
