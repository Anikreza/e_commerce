import React, {useState} from 'react'
import {actionTypes} from '../reducer';
import {useStateValue} from '../StateProvider';
import {useNavigate} from 'react-router';
import '../../sass/registration.scss'


const Register = () => {

    const [{user}, dispatch] = useStateValue();
    const navigate = useNavigate();
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    const Reg = async () => {
        let User = {name, email, password};
        dispatch({
            type: actionTypes.SET_USER,
            user: User,
        })

        let API = fetch('http://localhost:8000/api/register', {
            method: 'POST',
            body: JSON.stringify(User),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        API = await (await API).json();
        window.localStorage.setItem('user', JSON.stringify(API));
        navigate('/home');
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
            }}>Sign In
            </button>
        </div>
    )
}

export default Register
