import React, {useState, useEffect} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';
import { BsImage } from 'react-icons/bs';
import axios from "axios";

const Add = () => {
    const [name, setName] = useState('');
    const [author, setAuthor] = useState('');
    const [stock, setStock] = useState('');
    const [price, setPrice] = useState('');
    const [bookType, setBookType] = useState('Fantasy');
    const [coverType, setCoverType] = useState('Hard');
    const [categoryType, setCategoryType] = useState([]);
    const [categoryCover, setCategoryCover] = useState([]);
    const [description, setDescription] = useState('');
    const [file, setFile] = useState('');
    const api = process.env.MIX_API;

    useEffect(async () => {
        await axios.get(`${api}/addCategoryType`)
            .then(async (res) => {
                setCategoryType(res.data.book_type)
                setCategoryCover(res.data.cover_type)
            }).catch((error)=>{
                alert(error)
            }).then(()=>{
                console.log('Type',bookType)
            })
    }, [categoryType])

    async function upload() {
        console.log(name, price, description,bookType,coverType,stock,file.name)
        const Data = new FormData();
        Data.append('file', file);
        Data.append('name', name);
        Data.append('author', author);
        Data.append('stock', stock);
        Data.append('price', price);
        Data.append('bookType', bookType);
        Data.append('coverType', coverType);
        Data.append('description', description);

        await axios.post(`${api}/store`,Data
        ).then((response)=>{
            alert(response.statusText)
        }).catch((error)=>{
            alert(error)
        }).then(()=>{
            console.log('always executed')
        })
    }

    return (
        <div>
            <div className='add-page'>
                <input type='text' placeholder='Title Of The Book' name='name' onChange={(e)=>setName(e.target.value)}/>
                <br/>
                <br/>
                <input type='text' placeholder='Author Of The Book' name='author' onChange={(e)=>setAuthor(e.target.value)}/>
                <br/>
                <br/>
                <label htmlFor="book">Choose Book Genre:</label>
                <select id='book'  >
                    {
                        categoryType.map((data) => (
                            <option name='bookType' onClick={(e) => setBookType(data.id)}>
                                {data.category_book_types}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <label htmlFor="cover">Choose Cover type:</label>
                <select id='cover'  >
                    {
                        categoryCover.map((data) => (
                            <option name='coverType' onClick={(e) => setCoverType(data.id)}>
                                {data.category_cover_types}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <input type='text' placeholder='Reserved Stock Of The Book' name='stock' onChange={(e) => setStock(e.target.value)}/>
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
