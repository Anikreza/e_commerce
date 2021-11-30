import React, {useState,useEffect} from 'react'
import {useNavigate} from 'react-router';
import '../../sass/registration.scss'
import {useStateValue} from "../helpers/StateProvider";

const Login = () => {

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();
    const navigate = useNavigate();
    const api=process.env.MIX_API;
    const [{user,basket}, dispatch] = useStateValue();

    useEffect(() => {
        const url = location.pathname
        console.log(url)
    }, []);

    const login = async () => {
        let userdata = {email, password};
        let API = fetch(`${api}/login`, {
            method: 'POST',
            body: JSON.stringify(userdata),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        API = await (await API).json();
        window.localStorage.setItem('user', JSON.stringify(API));
        let user = JSON.parse(window.localStorage.getItem('user'))
        console.log('user is: ', user)
        if (user.message) {
            alert(user?.message)
        } else {
            navigate('/')
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
                <button style={{backgroundColor: '#859e7e'}} onClick={login}> Log In</button>
                <button style={{backgroundColor: '#b58b8b'}} onClick={() => {
                    navigate('/register')
                }}> Register
                </button>
            </div>
        </div>
    )
}

export default Login
