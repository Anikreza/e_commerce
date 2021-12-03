import React, {useState, useEffect} from 'react'
import {useStateValue} from '../states/StateProvider';
import {useNavigate} from 'react-router';
import '../../sass/registration.scss'
import axios from "axios";


const Register = () => {

    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [password_confirmation, setRepeatPassword] = useState('');
    const api = process.env.MIX_API;
    const [errors, setErrors] = useState([]);

    const Reg = async () => {

        const Data = new FormData();
        Data.append('name', name);
        Data.append('email', email);
        Data.append('password', password);
        Data.append('password_confirmation', password_confirmation);

        await axios.post(`${api}/register`, Data
        ).then((response) => {
            console.log(response.data)
            window.localStorage.setItem('user', JSON.stringify(response.data));
            navigate('/home')
        }).catch((e) => {
            console.log('errors:', e.response.data.errors)
            setErrors(e.response.data.errors)
        })

    }

    return (
        <div className='login-box'>
            <input type='email'
                   name='email'
                   placeholder='email' onChange={(e => setEmail(e.target.value))}/>
            <br/>
            <br/>
            {
                (errors?.email)?
                    <p>{errors?.email}</p>
                    :
                    ''
            }
            <input type='text'
                   name='name'
                   placeholder='name' onChange={(e => setName(e.target.value))}/>
            <br/>
            <br/>
            {
                (errors?.name)?
                    <p>{errors?.name}</p>
                    :
                    ''
            }
            <input type='password'
                   name='password'
                   placeholder='password' onChange={(e => setPassword(e.target.value))}/>
            <br/>
            <br/>
            {
                (errors?.password)?
                    <p>{errors?.password}</p>
                    :
                    ''
            }
            <input type='password'
                   name='password_confirmation'
                   placeholder='password_confirmation' onChange={(e => setRepeatPassword(e.target.value))}/>
            <br/>
            <br/>
            {
                (errors?.repeatPassword)?
                    <p>{errors?.repeatPassword}</p>
                    :
                    ''
            }
            <button style={{backgroundColor: '#b58b8b'}} onClick={Reg}>Sign Up</button>
            <button style={{backgroundColor: '#859e7e'}} onClick={() => {
                navigate('/login')
            }}>Log In
            </button>
        </div>
    )
}

export default Register
