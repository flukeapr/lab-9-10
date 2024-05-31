import { query } from "@/lib/db";
import { checkApiKey } from "@/lib/auth";
export default async function handle(req,res){
if(req.method=='GET'){
    const {key}=req.headers;
    const {cat}=req.query;
   if( checkApiKey(key)){
       const result = await query(`SELECT * FROM product WHERE category='${cat}'`)
       res.status(result.status.code).json(result)

   }else{
       res.status(401).json({status:{code:401,message:'Unauthorized'}})
   }
}else {
    res.status(405).json({ status: { code: 405, message: 'Method Not Allowed' } });
  }

}
