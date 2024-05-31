import { query } from "@/lib/db";
import jwp from 'jsonwebtoken';


const secretKey = "9022dfef7103eda3b8db9aa80c6d699722d7b002f1e8f30cbcf92467c8345ff9"

export default  async function handle(req,res){

    if(req.method=='POST'){

        const {email,password}=req.body;
        if(!email||!password){
             res.status(400).json({status:{code:400,message:'missing email or password'}})
        }

        const result = await query(`SELECT * FROM user WHERE email = "${email}" AND password = "${password}"`)

        const data = result.data[0];
        console.log(data);
        if(data){
            const payLoad ={
                email:email,
                password:password,
                name:data.name,
                role:data.role
            }
            jwp.sign(payLoad,secretKey,{expiresIn:"1d"},(err,token)=>{

                if(err){
                     res.status(500).json({status:{code:500,message:'Internal Server Error'}})
                }

                return res.status(200).json({status:{code:200,message:'Authorized'},data:payLoad,token:token})
            })

        }else{

             res.status(401).json({status:{code:401,message:'Unauthorized'}})
        }

      

    }else{

         res.status(405).json({ status: { code: 405, message: 'Method Not Allowed' } })
    }
}