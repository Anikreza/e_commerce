import React, {useState, useEffect, useCallback} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';
import {BsImage} from 'react-icons/bs';
import axios from "axios";

const Add = () => {
    const [name, setName] = useState('');
    const [author, setAuthor] = useState('');
    const [stock, setStock] = useState('');
    const [price, setPrice] = useState('');
    const [bookType, setBookType] = useState('');
    const [coverType, setCoverType] = useState('');
    const [categoryType, setCategoryType] = useState([]);
    const [categoryCover, setCategoryCover] = useState([]);
    const [description, setDescription] = useState('');
    const [file, setFile] = useState('');
    const api = process.env.MIX_API;

    const getBookType = useCallback( async () => {
        await axios.get(`${api}/addCategoryType`)
            .then(async (res) => {
                console.log(res.data)
                setCategoryType(res.data.book_type)
                setCategoryCover(res.data.cover_type)
            })
            .catch((error) => {
                alert(JSON.stringify(error))
            })
    }, []);

    useEffect(async () => {
        getBookType().then(r => r)
    }, [getBookType])

    async function upload() {
        console.log(name, price, description, bookType, coverType, stock, file.name)
        const Data = new FormData();
        Data.append('file', file);
        Data.append('name', name);
        Data.append('author', author);
        Data.append('stock', stock);
        Data.append('price', price);
        Data.append('bookType', bookType);
        Data.append('coverType', coverType);
        Data.append('description', description);

        await axios.post(`${api}/store`, Data
        ).then((response) => {
            alert(response.statusText)
        }).catch((error) => {
            alert(error)
        }).then(() => {
            console.log('always executed')
        })
    }

    return (
        <div>
            <div className='add-page'>
                <form>
                <input type='text' placeholder='Title Of The Book' name='name'
                       onChange={(e) => setName(e.target.value)}/>
                <br/>
                <br/>
                <input type='text' placeholder='Author Of The Book' name='author'
                       onChange={(e) => setAuthor(e.target.value)}/>
                <br/>
                <br/>
                <select id='book'
                        name="bookType"
                        onChange={(e) => setBookType(e.target.value)}
                        value={bookType}>
                    <option> Choose Book Genre</option>

                    {
                        categoryType.map((data) => (
                            <option key={data.id} value={data.id}>
                                {data.category_book_types}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <select id='cover'
                        name="coverType"
                        onChange={(e) => setCoverType(e.target.value)}
                        value={bookType}>
                    <option> Choose Cover type</option>
                    {
                        categoryCover.map((data) => (
                            <option key={data.id} value={data.id}>
                                {data.category_cover_types}
                            </option>
                        ))
                    }
                </select>
                <br/>
                <br/>
                <input type='text' placeholder='Reserved Stock Of The Book' name='stock'
                       onChange={(e) => setStock(e.target.value)}/>
                <br/>
                <br/>
                <input style={{color:'grey'}}  id='image' type='file' placeholder='file' name='file'
                       onChange={(e) => setFile(e.target.files[0])}/>
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
                </form>
            </div>
        </div>
    )
}

export default Add
