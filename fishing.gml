#define fishing(x, y)

    var _fishingnumbermax, _fishingnumber, _fishingprogressmax, _fished;
    
    var _currentGearItem = GearGet(global.gearCategoryRods, GearData.Current);
    
    fishedmessage = "Rod| Fished"
    
    //Rod Stages
    
    if(_currentGearItem == global.itemBasicRod){
        
        _fishingprogressmax = 70;
        
        global.fishingprogress += irandom_range(1, 10);        
        
        //Trace("Fishing... ")
//        Trace(global.fishingprogress);
//        Trace(_fishingnumber);
        
        if(global.fishingprogress >= _fishingprogressmax){

            _fishingnumber = irandom_range(0, 119); 
            _fished = 1;
            
            if(_fished == 1){
                
                Trace(fishedmessage)
                
                _fished = 0;
    
                if(_fishingnumber >= 24){
                    _fishingnumber = 67
                } else {
                    
                }
            } else {
                
            }
            
            for (var i = 0; i < irandom_range(1,5); i++) {
                DropItem(objPlayer.x, objPlayer.y, _fishingnumber, 1)
            }
            global.fishingprogress = 0;
        
        }
        
    } else if(_currentGearItem == global.itemReinforcedWoodRod){
        
        _fishingprogressmax = 65;
        
        global.fishingprogress += irandom_range(1, 10);        

        if(global.fishingprogress >= _fishingprogressmax){
            _fishingnumber = irandom_range(0, 119); 
            _fished = 1;
            
            if(_fished == 1){
                
                Trace(fishedmessage)
                
                _fished = 0;
    
                if(_fishingnumber >= 38){
                    _fishingnumber = 67
                } else {
                    
                }
            } else {
                
            }
            
            for (var i = 0; i < irandom_range(1,5); i++) {
                DropItem(objPlayer.x, objPlayer.y, _fishingnumber, 1)
            }
            global.fishingprogress = 0;
        
        }
        
    } else if(_currentGearItem == global.itemIronRod){
        
        _fishingprogressmax = 60;
        
        global.fishingprogress += irandom_range(1, 10);        

        if(global.fishingprogress >= _fishingprogressmax){
            _fishingnumber = irandom_range(0, 119); 
            _fished = 1;
            
            if(_fished == 1){
    
                Trace(fishedmessage)
    
                _fished = 0;
    
                if(_fishingnumber >= 51){
                    _fishingnumber = 67
                } else {
                    
                }
            } else {
                
            }
            
            for (var i = 0; i < irandom_range(1,5); i++) {
                DropItem(objPlayer.x, objPlayer.y, _fishingnumber, 1)
            }
            global.fishingprogress = 0;
        
        }
        
    } else if(_currentGearItem == global.itemReinforcedIronRod){
        
        _fishingprogressmax = 55;
        
        global.fishingprogress += irandom_range(1, 10);        
        
        if(global.fishingprogress >= _fishingprogressmax){
            _fishingnumber = irandom_range(0, 119); 
            _fished = 1;
            
            if(_fished == 1){
    
                Trace(fishedmessage)
    
                _fished = 0;
    
                if(_fishingnumber >= 61){
                    _fishingnumber = 67
                } else {

                }
            } else {

            }
            
            for (var i = 0; i < irandom_range(1,5); i++) {
                DropItem(objPlayer.x, objPlayer.y, _fishingnumber, 1)
            }
            global.fishingprogress = 0;
        
        }
        
    } else {
        exit;
    }
    
    
    
    
    //Rod Calculating
  
