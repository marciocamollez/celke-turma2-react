import React, {createContext, useEffect, useState} from "react";
import api from '../config/configApi';

const Context = createContext();

function AuthProvider({children}){

    /* verifica se o usuário está logado e autenticado com o token */
    const [authenticated, setAuthenticated] = useState(false);
    const [loading, setLoading] = useState(true);

    /* Use Effect para executar uma vez ao rodar a página */
    useEffect(() => {
        const getLogin = async () => {
            /* pega o token que foi gerado do usuário que foi salvo no navegador */
            const token = localStorage.getItem('token');

            /* passa o token pelos headers e troca o state para true */
            if(token && valUser()){
                api.defaults.headers.Authorization = `Bearer ${(token)}`;
                setAuthenticated(true);
            };

            /* Após terminado, passa loading para falso para remover a mensagem de carregando */
            setLoading(false);
        }

        getLogin();
    },[]);

    /* valida se o token enviado é o mesmo do navegador. O async indica que enquanto isso não for verificado, não avança */
    const valUser = async () => {
        const valueToken = localStorage.getItem('token');

        const headers = {
            'headers': {
                'Authorization': 'Bearer ' + valueToken
            }
        };

        await api.get("/val-token", headers)
        .then((response) => {
            return true;
        }).catch(() => {
            setAuthenticated(false);
            localStorage.removeItem('token');
            api.defaults.headers.Authorization = undefined;
            return false;
        })
    }

    /* avisa que o usuário está logado e com o token */
    async function signIn(sit){
        setAuthenticated(true);
    }

    function handleLogout(){
        setAuthenticated(false);
        localStorage.removeItem('token');
        api.defaults.headers.Authorization = undefined;
    }

    if(loading){
        return <h1>Carregando...</h1>
    }

    /* passa as variáveis authenticated e signin para a página para compartilhar o status do login */
    return(
        <Context.Provider value={{authenticated, signIn, handleLogout}}>
            {children}
        </Context.Provider>
    );
}

export {Context, AuthProvider};