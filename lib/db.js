import serverlessMysql from "serverless-mysql";

export const db = serverlessMysql({
    config: {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'storeapi',
        port:3306
    },
});


export async function query(query,params){
    try {
        const results = await db.query(query,params);
        await db.end()
       return {status :{code: 200,message: 'OK'},data:results}
    } catch (error) {
        console.log(error);
        return {status :{code: 400,message: 'Bad Request'}}
    }
  
}

