const API_KEY = "9022dfef7103eda3b8db9aa80c6d699722d7b002f1e8f30cbcf92467c8345ff9"

export function checkApiKey(apiKey){
    if(apiKey===API_KEY){
        return true 
    }else{
        return false
    }
}
