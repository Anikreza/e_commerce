import React, {useState, useEffect, useCallback} from 'react'
import '../../../sass/upload.scss'
import TextareaAutosize from 'react-textarea-autosize';
import axios from "axios";
import {useNavigate} from "react-router-dom";

const Add = () => {
    const [name, setName] = useState('');
    const [author, setAuthor] = useState('');
    const [stock, setStock] = useState('');
    const [price, setPrice] = useState('');
    const [status, setStatus] = useState('unPublished');
    const [bookType, setBookType] = useState('');
   // const [newBookType, setNewBookType] = useState('');
    const [coverType, setCoverType] = useState('');
    const [categoryType, setCategoryType] = useState([]);
    const [categoryCover, setCategoryCover] = useState([]);
    const [description, setDescription] = useState('');
    const [file, setFile] = useState('');
    const [res, setResponse] = useState('');
    const [errors, setErrors] = useState([]);
  //  const [newType, setNewType] = useState(false);
   // const [modal, setModal] = useState(true);
    const api = process.env.MIX_API;
    const navigate=useNavigate()

    const getBookType = useCallback(async () => {
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
        const Data = new FormData();
        Data.append('file', file);
        Data.append('name', name);
        Data.append('author', author);
        Data.append('stock', stock);
        Data.append('price', price);
        Data.append('bookType', bookType);
        Data.append('coverType', coverType);
        Data.append('description', description);
        // Data.append('newBookType', newBookType);
        Data.append('status', status);

            await axios.post(`${api}/store`, Data
            ).then((response) => {
                if(response.status===201){
                    setResponse('Product Added Successfully!')
                    navigate('/edit')
                }
            }).catch((e) => {
                setErrors(e.response.data.errors)
                console.log('errors:', e.response.data.errors)
            })

    }

    // const setNewBook=(e)=>{
    //     setNewType(!newType)
    //     setModal(false)
    // }

    return (
        <div>
            <div className='add-page'>
                <form onSubmit={(e) => e.preventDefault()}>
                    <input
                        type='text'
                        placeholder='* Title Of The Book'
                        name='name'
                        onChange={(e) => setName(e.target.value)}/>
                    {
                        (errors?.name)?
                            <p>{errors?.name}</p>
                            :
                            ''
                    }
                    <input
                        type='text'
                        placeholder='* Author Of The Book'
                        name='author'
                        onChange={(e) => setAuthor(e.target.value)}/>
                    {
                        (errors?.author)?
                            <p>{errors?.author}</p>
                            :
                            ''
                    }
                    <select
                        id='book'
                        name="bookType"
                        onChange={(e) => setBookType(e.target.value)}
                        value={bookType}
                    >
                        <option> * Choose Book Genre</option>
                            {
                                categoryType.map((data) => (
                                    <option key={data.id} value={data.id}>
                                        {data.category_book_types}
                                    </option>
                                ))
                            }
                    </select>
                    {/*<button className={(modal)?'selButton':'hide'} onClick={setNewBook}>*/}
                    {/*        Create New Book Genre*/}
                    {/*</button>*/}
                    {/*{*/}
                    {/*    (newType)?*/}
                    {/*        <input*/}
                    {/*            placeholder='Create a new book genre'*/}
                    {/*            type='text'*/}
                    {/*            onChange={(e)=>setBookType(e.target.value)}*/}
                    {/*            id='bookType'*/}
                    {/*            name="bookType"*/}
                    {/*        />*/}
                    {/*        :*/}
                    {/*        ''*/}
                    {/*}*/}
                    {
                        (errors?.bookType)?
                            <p>{errors?.bookType}</p>
                            :
                            ''
                    }
                    <select
                        id='cover'
                        name="coverType"
                        onChange={(e) => setCoverType(e.target.value)}
                        value={coverType}
                    >
                        <option>  Choose Cover type</option>
                            {
                                categoryCover.map((Data) => (
                                    <option key={Data.id} value={Data.id}>
                                        {Data.category_cover_types}
                                    </option>
                                ))
                            }
                    </select>
                    <input
                        type='text'
                        placeholder='* Reserved Stock Of The Book'
                        name='stock'
                        onChange={(e) => setStock(e.target.value)}/>
                    {
                        (errors?.stock)?
                            <p>{errors?.stock}</p>
                            :
                            ''
                    }
                    <input
                        style={{color: 'grey'}}
                        type='file'
                        placeholder='* Product Image'
                        name='file'
                        onChange={(e) => setFile(e.target.files[0])}/>
                    {
                        (errors?.file)?
                            <p>{errors?.file}</p>
                            :
                            ''
                    }
                    <input
                        type='text'
                        placeholder='* Price'
                        name='price'
                        onChange={(e) => setPrice(e.target.value)}/>
                    {
                        (errors?.price)?
                            <p>{errors?.price}</p>
                            :
                            ''
                    }
                    <TextareaAutosize
                        className='auto_height'
                        name='description'
                        onChange={(e) => setDescription(e.target.value)}
                        placeholder="* Product Description"
                        minRows={3}
                        maxRows={20}
                    />
                    {
                        (errors?.description)?
                            <p>{errors?.description}</p>
                            :
                            ''
                    }
                    <br/>
                    <button onClick={upload}>
                        Add Product
                    </button>
                </form>
                {
                    (res)?
                        <p>{res}</p>
                        :
                        ''
                }
            </div>
        </div>
    )
}

export default Add
