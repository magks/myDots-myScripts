#!/bin/bash
# Set (toggle) environment variables appropriately for PRIME GPU switching
# between onboard Intel 530? GPU and discrete Nvidia 940MX GPU

DISCRETE_DRIVER_NAME=nouveau
ONBOARD_DRIVER_NAME=va_gl

DRI_PRIME_DEFAULT=1

### Not set at ALL
#unset DRI_PRIME
if [ -z "${DRI_PRIME+x}" ]; then
   echo "\$DRI_PRIME is not set. Setting default:"$DRI_PRIME_DEFAULT && 
   export DRI_PRIME=$DRI_PRIME_DEFAULT &&
   DRI_PRIME=$DRI_PRIME_DEFAULT
else
   echo "\$DRI_PRIME found and is set to \"$DRI_PRIME\"."
fi
 
### 'set but empty' or not?
#iinput=""
if [ -z "$DRI_PRIME" -a "${DRI_PRIME+x}" = "x" ]; then
   echo "\$DRI_PRIME is empty. Setting default:"$DRI_PRIME_DEFAULT &&
   export DRI_PRIME=$DRI_PRIME_DEFAULT &&
   DRI_PRIME=$DRI_PRIME_DEFAULT
fi

DRI_PRIME=$DRI_PRIME
if [ $DRI_PRIME -eq 0 ]; then
    # Onboard GPU is on and discrete gpu is off
    echo "Turning on DiscreteGPU:"$DISCRETE_DRIVER_NAME
    echo "Turning off OnboardGPU"
    export VDPAU_DRIVER=$DISCRETE_DRIVER_NAME
    export DRI_PRIME=1
elif [ $DRI_PRIME -eq 1 ]; then
    # Discrete GPU is on and onboard GPU is off
    echo "Turning off DiscreteGPU"
    echo "Turning on OnboardGPU"
    export VDPAU_DRIVER=$ONBOARD_DRIVER_NAME
    export DRI_PRIME=0
else
   echo "DRI_PRIME environment variable must equal 0 or 1."
   echo "DRI_PRIME="$DRI_PRIME
fi
