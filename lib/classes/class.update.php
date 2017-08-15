<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of class
 *
 * @author developer
 */
class update {

    protected $cVersion;
    protected $db;
    protected $server;
    protected $path;
    protected $updateFolder;

    public function __construct($db, $server) {
        $this->db = $db;
        $this->server = $server;
        $this->path = $this->server["CONTEXT_DOCUMENT_ROOT"] . "/update/";
        $this->updateFolder = scandir($this->path);
        $this->cVersion = $this->getCurrentVersion();
    }

    public function __destruct() {
        
    }

    protected function useUpdate($cVersion) {
        $sql = file_get_contents($this->path . $cVersion . "/update.sql");
        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute();
        return $result;
    }

    protected function getCurrentVersion() {
        $sql = "SELECT * FROM tMetaData";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        if ($result = $stmt->fetchObject()) {
            if ((int)$this->updateFolder[count($this->updateFolder) - 1] !== (int)$result->cMonitoringVersion) {
                $pos = array_search((int)$result->cMonitoringVersion + 1, $this->updateFolder);
                $count = count($this->updateFolder);
                for($i = $pos; $i < $count; $i++){
                    $result = $this->useUpdate((int)$this->updateFolder[$i]);
                    if($result !== true){
                        die("Update konnte nicht durchgef&uuml;hrt werden, da das SQL-Statement in der Datei: ".$this->path . (int)$this->updateFolder[$i] . "/update.sql"." fehlerhaft ist.\n". file_get_contents($this->path . (int)$this->updateFolder[$i] . "/update.sql"));
                    }
                }
            }
            return (int)$this->updateFolder[count($this->updateFolder) - 1];
        } else {
            $this->useUpdate(100);
            return 100;
        }
    }
    
    public function getVersionNumber(){
        return $this->cVersion;
    }

}
