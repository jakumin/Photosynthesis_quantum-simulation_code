import Quipper
import Quantum.Synthesis.RotationDecomposition
import Quantum.Synthesis.Matrix
import Quantum.Synthesis.Ring
import QuipperLib.Synthesis

import Data.Complex
import Data.Ratio


disp_error :: Matrix Four Four (Cplx Float) -> IO()
disp_error x = do 
		print "------------    Resultant errors of decomposing the basis transformation matrix    ---------------"
		print x

-- define 4 x 4 matrix constructor
--  mytranspose is the basis transformation matrix for a four molecule system
mytranspose :: Matrix Four Four (Cplx Float)
mytranspose = matrix [[ Cplx (-0.79571) (0), Cplx (0.60539) (0),Cplx (-0.01765) (0) , Cplx (-0.00567) (0)],
                   [ Cplx (-0.59296) (0), Cplx (-0.77242) (0),Cplx (0.21187) (0), Cplx (0.08290) (0)],
                   [ Cplx (-0.11928) (0),Cplx (-0.18497) (0), Cplx (-0.77792) (0), Cplx (-0.58855) (0)],
                   [Cplx (-0.03179) (0) , Cplx (-0.05149) (0), Cplx (-0.59130) (0), Cplx (0.80418) (0)]]

main :: IO()
main = do
  print "*********************   U (Computational basis -> Energy basis)   *****************************"
  let rotations_trans = rotation_decomposition mytranspose -- apply the rotation decomposition algorithm
  print (map show (rotations_trans)) -- print the resultant decomposition
  disp_error ((matrix_of_elementaries rotations_trans)-mytranspose) -- display the error of decomposing the matrix

