import React, {useState} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';

const Add = () => {
    const [name, setName]=useState('');
    const [stock, setStock]=useState('');
    const [price, setPrice]=useState('');
    const [bookType, setBookType]=useState('');
    const [description, setDescription]=useState('');
    const [file, setFile]=useState('');
    const api=process.env.MIX_API;

    async function upload(){
        console.log(name, price, description,file.name)
        const Data= new FormData();
        Data.append('file',file);
        Data.append('name',name);
        Data.append('stock',stock);
        Data.append('bookType',bookType);
        Data.append('price',price);
        Data.append('description',description);

        let result=await fetch(`${api}/addproduct`,{
            method:'POST',
            body:Data
        })
        alert('saved your data')
    }
    return (
        <div>
            <div className='add-page'>
                <input type='text' placeholder='name' name='name' onChange={(e)=>setName(e.target.value)}/>
                <br/>
                <br/>
                <input type='text' placeholder='book type' name='bookType' onChange={(e)=>setBookType(e.target.value)}/>
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
                    name='descrption'
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
