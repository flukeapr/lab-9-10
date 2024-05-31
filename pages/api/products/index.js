import { query } from "@/lib/db";
import { checkApiKey } from "@/lib/auth";
export default async function handle(req,res){
if(req.method=='GET'){
    const {key}=req.headers;
   if( checkApiKey(key)){
       const result = await query("SELECT * FROM product")
       res.status(result.status.code).json(result)

   }else{
       res.status(401).json({status:{code:401,message:'Unauthorized'}})
   }
}else if(req.method==='POST'){
    const {key}=req.headers;
   
   if( checkApiKey(key)){ 
    const { title, price, description, image, category } = req.body;
    await query(`INSERT INTO product (title, price, description, image, category) VALUES ("${title}", "${price}", "${description}", "${image}", "${category}")`);
    res.status(204).send()


   }else{
       res.status(401).json({status:{code:401,message:'Unauthorized'}})
   }
}else {
    res.status(405).json({ status: { code: 405, message: 'Method Not Allowed' } });
  }

}
