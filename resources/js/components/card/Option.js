import React, {useState, useEffect} from "react";

const comp = ({data}) => {
    console.log('data',data[25])
    return (
        <div>
            {
                (!data)?
                  <div>
                      <p>damn</p>
                  </div>
                :
                    <select >
                        <option value='2'>'a'</option>
                        <option value='2'>'ssss'</option>
                        <option value='2'>'dddddd'</option>
                    </select>
            }


        </div>
    )
}

export default comp













