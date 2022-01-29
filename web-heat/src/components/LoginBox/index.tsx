import styles from './styles.module.scss'

import {VscGithubInverted} from 'react-icons/vsc';
import { AuthContext } from '../../context/auth';
import { useContext } from 'react';

export function LoginBox(){
    const {signInUrl} = useContext(AuthContext);

    return(
        <div className={styles.loginBoxWrapper}>
            <strong> Entre e compartilhe a sua mensagem</strong>
            <a href={signInUrl} className={styles.signInWithGithub}>
                <VscGithubInverted size="24"/>
                Entrar com Github
            </a>
        </div>
    )
}