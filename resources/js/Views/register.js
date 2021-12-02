import React, {useState, useEffect} from 'react'
import {useStateValue} from '../helpers/StateProvider';
import {useNavigate} from 'react-router';
import '../../sass/registration.scss'


const Register = () => {

    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const api=process.env.MIX_API;

    const Reg = async () => {
        let User = {name, email, password};

        let API = fetch(`${api}/register`, {
            method: 'POST',
            body: JSON.stringify(User),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        API = await (await API).json();
        window.localStorage.setItem('user', JSON.stringify(API));
        window.location.replace('/home')
    }

    return (
        <div className='login-box'>
            <input type='text'
                   placeholder='name' onChange={(e => setName(e.target.value))}/>
            <br/>
            <br/>
            <input type='password'
                   placeholder='password' onChange={(e => setPassword(e.target.value))}/>
            <br/>
            <br/>
            <input type='text'
                   placeholder='email' onChange={(e => setEmail(e.target.value))}/>
            <br/>
            <br/>
            <button style={{backgroundColor: '#b58b8b'}} onClick={Reg}>Sign Up</button>
            <button style={{backgroundColor: '#859e7e'}} onClick={() => {
                navigate('/login')
            }}>Log In
            </button>
        </div>
    )
}

export default Register
