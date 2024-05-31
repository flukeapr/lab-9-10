import { query } from "@/lib/db";
import { checkApiKey } from "@/lib/auth";

export default async function handle(req,res){
  
if(req.method=='GET'){
    const {key}=req.headers;
    const {pid} = req.query;
   if( checkApiKey(key)){ 
       const result = await query(`SELECT * FROM product WHERE id= ${pid}`);
       res.status(result.status.code).json(result);

   }else{
       res.status(401).json({status:{code:401,message:'Unauthorized'}})
   }
}else if(req.method==='PUT'){
    const {key}=req.headers;    
    const {pid} = req.query;
   if( checkApiKey(key)){
    const { title, price, description, image, category } = req.body;
    await query(`UPDATE product SET title="${title}", price="${price}", description="${description}", image="${image}", category="${category}" WHERE id=${pid}`);
    res.status(200);
    res.json({status:{code:200,message:'OK'}})

   }
}else if(req.method==='DELETE'){
    const {key}=req.headers;    
    const {pid} = req.query;
   if( checkApiKey(key)){
   
    await query(`DELETE FROM product WHERE id = ${pid}`);
    res.status(204).send()

   }
}
}
