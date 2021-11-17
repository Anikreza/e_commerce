import React, {useState} from 'react'
import {useNavigate} from 'react-router';
import '../../sass/registration.scss'

const Login = () => {

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();
    const navigate = useNavigate();
    let user = JSON.parse(window.localStorage.getItem('user'));

    const login = async () => {
        let user = JSON.parse(window.localStorage.getItem('user'));
        let userdata = {email, password};
        let API = fetch('http://localhost:8000/api/login', {
            method: 'POST',
            body: JSON.stringify(userdata),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        API = await (await API).json();
        window.localStorage.setItem('user', JSON.stringify(API));
        if (!user) {
            navigate('/');
            window.location.reload();
        } else {
            navigate('/home');
            window.location.reload();
        }
    }

    return (
        <div className='login'>
            <div className='login-box'>
                <input type='text' placeholder='email' onChange={(e) => setEmail(e.target.value)}/>
                <br/>
                <br/>
                <input type='password' placeholder='password' onChange={(e) => setPassword(e.target.value)}/>
                <br/>
                <br/>
                <button style={{backgroundColor: '#859e7e'}} onClick={login}> Sign In</button>
                <button style={{backgroundColor: '#b58b8b'}} onClick={() => {
                    navigate('/register')
                }}> Sign Up
                </button>
            </div>
        </div>
    )
}

export default Login
