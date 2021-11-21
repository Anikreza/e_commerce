import React, {useState, useEffect} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';

const Add = () => {
    const [name, setName]=useState('');
    const [stock, setStock]=useState('');
    const [price, setPrice]=useState('');
    const [bookType, setBookType]=useState('');
    const [covertype, setCoverType]=useState([]);
    const [description, setDescription]=useState('');
    const [file, setFile]=useState('');
    const [state, setState]=useState(true);
    const api=process.env.MIX_API;

    useEffect(async()=> {
        let result=await fetch(`${api}/addCategoryType`)
        let Result= await result.json();
        setCoverType(Result)

    }, [state])

    const getCategory =async(e)=>{
        setState(false)
        console.log(covertype[12].coverType)
    }

    async function upload(){
        console.log(name, price, description,file.name)
        const Data= new FormData();
        Data.append('file',file);
        Data.append('name',name);
        Data.append('stock',stock);
        Data.append('price',price);
        Data.append('description',description);

        let result=await fetch(`${api}/store`,{
            method:'POST',
            body:Data,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        alert('saved your data')
    }
    return (
        <div>
            <div className='add-page'>
                <input type='text' placeholder='name' name='name' onChange={(e)=>setName(e.target.value)}/>
                <br/>
                <br/>
                <select>
                    <option value="A">Apple</option>
                </select>
                <br/>
                <br/>
                <select value='Selet Type' onChange={getCategory}>
                    <option value='1'>{covertype.map((data)=>(
                        data.coverType
                        ))}</option>
                    <option> 'aaaa'</option>
                </select>
                <br/>
                <br/>
                <input type='text' placeholder='cover' name='coverType' onChange={(e)=>setCoverType(e.target.value)}/>
                <br/>
                <br/>
                <input type='text' placeholder='stock' name='stock' onChange={(e)=>setStock(e.target.value)}/>
                <br/>
                <br/>
                <input type='file' placeholder='file' name='file' onChange={(e)=>setFile(e.target.files[0])}/>
                <br/>
                <br/>
                <input type='text'  placeholder='price' name='price' onChange={(e)=>setPrice(e.target.value)}/>
                <br/>
                <br/>
                <TextareaAutosize
                    className='auto_height'
                    name='description'
                    onChange ={(e)=>setDescription(e.target.value)}
                    placeholder="Description"
                    minRows={3}
                    maxRows={20}
                />
                <br/>
                <br/>
                <button onClick={upload}>Add Product</button>
            </div>
        </div>
    )
}

export default Add
