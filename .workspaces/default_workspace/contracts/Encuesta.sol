// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract encuesta {

    uint siguiente_id;
    uint siguiente_usuario;


    struct respuestas{
        bool[] respuestas;
    }
    
    mapping( uint => respuestas ) usuarios;

    //constructor () public{}

    

    struct pregunta{
        uint256 index;
        string nombre_pregunta;

    }
    
    pregunta[] preguntas;

    function crear_pregunta(string memory _nombre_pregunta) public{
        preguntas.push(pregunta(siguiente_id, _nombre_pregunta));
        siguiente_id++;

    }

    function buscar_pregunta(uint _index) internal view returns (uint){
        for (uint i = 0; i < preguntas.length; i++){
            if (preguntas[i].index == _index) {
                return i;
            }
        }
        revert('No existe la pregunta');
    }

    function ver_pregunta(uint256 _index) view public returns(uint256, string memory){
        uint index = buscar_pregunta(_index);
        return (preguntas[index].index, preguntas[index].nombre_pregunta);

    }

    function actualizar_pregunta(uint _id, string memory _nombre_pregunta) public {
       uint256 index = buscar_pregunta(_id);
       preguntas[index].nombre_pregunta = _nombre_pregunta;
    }

    function borrar_pregunta(uint _id) public{
        uint256 index = buscar_pregunta(_id);
        delete preguntas[index];
    }

    function ingresar_usuario(uint _ID) public returns (bool){
        for (uint i = 0; i < usuarios.length; i++){
            if (usuarios[i].ID == _ID){
                return false;
            }
            usuarios[_ID] = [];
            return true;
        }
        
    

    }


}
