import React, {useState, useEffect} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';
import { BsImage } from 'react-icons/bs';

const Add = () => {
    const [name, setName] = useState('');
    const [stock, setStock] = useState('');
    const [price, setPrice] = useState('');
    const [bookType, setBookType] = useState('A');
    const [coverType, setCoverType] = useState('B');
    const [category, setCategory] = useState([]);
    const [description, setDescription] = useState('');
    const [file, setFile] = useState('');
    const api = process.env.MIX_API;

    useEffect(async () => {
        let result = await fetch(`${api}/addCategoryType`)
        let Result = await result.json();
        setCategory(Result)
    }, [])

    async function upload() {
        console.log(name, price, description,bookType,coverType,stock,file.name)
        const Data = new FormData();
        Data.append('file', file);
        Data.append('name', name);
        Data.append('stock', stock);
        Data.append('price', price);
        Data.append('bookType', bookType);
        Data.append('coverType', coverType);
        Data.append('description', description);

        let result = await fetch(`${api}/store`, {
            method: 'POST',
            body: Data
        })
        alert('saved your data')
    }

    return (
        <div>
            <div className='add-page'>
                <input type='text' placeholder='name' name='name' onChange={(e) => setName(e.target.value)}/>
                <br/>
                <br/>
                <label htmlFor="book">Choose Book Genre:</label>
                <select id='book' name='bookType' onChange={(e)=>setBookType(e.target.value)}>
                    {
                        category.map((data) => (
                            <option>
                                {data.bookType}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <label for="cover">Choose Cover type:</label>
                <select id='cover' name='coverType' onChange={(e)=>setCoverType(e.target.value)}>
                    {
                        category.map((data) => (
                            <option>
                                {data.coverType}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <input type='text' placeholder='stock' name='stock' onChange={(e) => setStock(e.target.value)}/>
                <br/>
                <br/>
                <label htmlFor="image"><BsImage size={20} style={{cursor:"pointer"}}/> Upload Product Image</label>
                <input  style={{display:"none"}}   id='image' type='file' placeholder='file' name='file' onChange={(e) => setFile(e.target.files[0])}/>
                <br/>
                <br/>
                <input type='text' placeholder='price' name='price' onChange={(e) => setPrice(e.target.value)}/>
                <br/>
                <br/>
                <TextareaAutosize
                    className='auto_height'
                    name='description'
                    onChange={(e) => setDescription(e.target.value)}
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
